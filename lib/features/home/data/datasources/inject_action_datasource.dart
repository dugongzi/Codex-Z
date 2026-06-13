import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:web_socket_channel/io.dart';

class InjectActionDatasource {
  final Dio _dio;

  InjectActionDatasource() : _dio = _buildLoopbackDio();

  static Dio _buildLoopbackDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3),
      ),
    );
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.findProxy = (uri) => 'DIRECT';
      return client;
    };
    return dio;
  }

  /// 端口已有 CDP 服务在监听则返回 true
  Future<bool> isDebugPortAlive(int debugPort) async {
    try {
      await _dio.getUri<List<dynamic>>(
        Uri.parse('http://127.0.0.1:$debugPort/json'),
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  /// 启动目标程序并附加 --remote-debugging-port 参数
  Future<void> launchExecutable({
    required String executablePath,
    required int debugPort,
  }) async {
    await Process.start(
      executablePath,
      ['--remote-debugging-port=$debugPort'],
      mode: ProcessStartMode.detached,
    );
  }

  /// 轮询直到出现可注入的 page target 或超时
  Future<void> waitForDebugPort({
    required int debugPort,
    Duration timeout = const Duration(seconds: 30),
    Duration interval = const Duration(milliseconds: 500),
  }) async {
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      try {
        await _findPageWebSocketUrl(debugPort);
        return;
      } catch (_) {
        await Future.delayed(interval);
      }
    }
    throw TimeoutException('No page target on port $debugPort');
  }

  Future<void> injectScript({
    required int debugPort,
    required String script,
  }) async {
    final wsUrl = await _findPageWebSocketUrl(debugPort);
    final channel = IOWebSocketChannel.connect(Uri.parse(wsUrl));
    try {
      await _sendCommand(
        channel,
        id: 1,
        method: 'Runtime.evaluate',
        params: {
          'expression': script,
          'allowUnsafeEvalBlockedByCSP': true,
        },
      );
    } finally {
      await channel.sink.close();
    }
  }

  Future<String> _findPageWebSocketUrl(int debugPort) async {
    final response = await _dio.getUri<List<dynamic>>(
      Uri.parse('http://127.0.0.1:$debugPort/json'),
    );
    final targets = response.data ?? const [];
    for (final raw in targets) {
      final target = raw as Map<String, dynamic>;
      if (target['type'] == 'page' &&
          target['webSocketDebuggerUrl'] is String) {
        return target['webSocketDebuggerUrl'] as String;
      }
    }
    throw StateError('No injectable page target on port $debugPort');
  }

  Future<Map<String, dynamic>> _sendCommand(
    IOWebSocketChannel channel, {
    required int id,
    required String method,
    Map<String, dynamic>? params,
  }) async {
    final completer = Completer<Map<String, dynamic>>();
    final subscription = channel.stream.listen((raw) {
      final msg = jsonDecode(raw as String) as Map<String, dynamic>;
      if (msg['id'] == id && !completer.isCompleted) {
        completer.complete(msg);
      }
    });
    channel.sink.add(jsonEncode({
      'id': id,
      'method': method,
      if (params != null) 'params': params,
    }));
    try {
      return await completer.future.timeout(const Duration(seconds: 5));
    } finally {
      await subscription.cancel();
    }
  }
}
