import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shim/features/home/data/datasources/inject_action_datasource.dart';
import 'package:shim/features/home/data/repositories/inject_action_repository_impl.dart';
import 'package:shim/features/home/domain/repositories/inject_action_repository.dart';
import 'package:shim/features/settings/presentation/providers/config_query_provider.dart';
import 'package:url_launcher/url_launcher.dart';

part 'inject_action_provider.g.dart';

@riverpod
InjectActionDatasource injectActionDatasource(Ref ref) {
  return InjectActionDatasource();
}

@riverpod
InjectActionRepository injectActionRepository(Ref ref) {
  final dataSource = ref.watch(injectActionDatasourceProvider);
  return InjectActionRepositoryImpl(dataSource: dataSource);
}

@riverpod
Future<bool> isDebugPortAlive(Ref ref, {required int debugPort}) async {
  return ref
      .read(injectActionRepositoryProvider)
      .isDebugPortAlive(debugPort: debugPort);
}

@riverpod
Future<String?> findExecutableByPort(Ref ref, {required int debugPort}) async {
  return ref
      .read(injectActionRepositoryProvider)
      .findExecutableByPort(debugPort: debugPort);
}

@riverpod
Future<void> openInspector(Ref ref, {required int debugPort}) async {
  final repo = ref.read(injectActionRepositoryProvider);
  final url = await repo.findDevtoolsUrl(debugPort: debugPort);
  if (url == null) {
    throw Exception('未检测到 Codex 正在运行');
  }
  await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
}

@riverpod
Future<void> launchExecutable(
  Ref ref, {
  required String executablePath,
  required int debugPort,
}) async {
  await ref.read(injectActionRepositoryProvider).launchExecutable(
        executablePath: executablePath,
        debugPort: debugPort,
      );
}

@riverpod
Future<void> waitForDebugPort(Ref ref, {required int debugPort}) async {
  await ref
      .read(injectActionRepositoryProvider)
      .waitForDebugPort(debugPort: debugPort);
}

@riverpod
Future<String> loadInjectScript(Ref ref) async {
  return ref.read(injectActionRepositoryProvider).loadInjectScript();
}

@riverpod
Future<void> injectScript(
  Ref ref, {
  required int debugPort,
  required String script,
}) async {
  await ref
      .read(injectActionRepositoryProvider)
      .injectScript(debugPort: debugPort, script: script);
}

/// 直接注入到端口（要求端口上已经有 page）
@riverpod
Future<void> injectToRunningPort(Ref ref, {required int debugPort}) async {
  final repo = ref.read(injectActionRepositoryProvider);
  final script = await repo.loadInjectScript();
  await repo.injectScript(debugPort: debugPort, script: script);
}

/// 完整流程：
/// - 端口活 + 路径已设 → 直接注入到现有窗口
/// - 端口活 + 路径未设 → 抛 CodexAlreadyRunningException(detectedPath)，UI 弹窗确认
/// - 端口不活 + 路径已设 → 启动 → 等就绪 → 注入
/// - 端口不活 + 路径未设 → 抛 CodexPathNotSetException
@riverpod
Future<void> launchAndInject(Ref ref, {required int debugPort}) async {
  final repo = ref.read(injectActionRepositoryProvider);
  final path = await ref.read(codexAppPathProvider.future);
  final hasPath = path != null && path.isNotEmpty;

  if (await repo.isDebugPortAlive(debugPort: debugPort)) {
    if (hasPath) {
      final script = await repo.loadInjectScript();
      await repo.injectScript(debugPort: debugPort, script: script);
      return;
    }
    final detected = await repo.findExecutableByPort(debugPort: debugPort);
    throw CodexAlreadyRunningException(detected);
  }

  if (!hasPath) {
    throw const CodexPathNotSetException();
  }

  await repo.launchExecutable(executablePath: path, debugPort: debugPort);
  await repo.waitForDebugPort(debugPort: debugPort);
  final script = await repo.loadInjectScript();
  await repo.injectScript(debugPort: debugPort, script: script);
}

class CodexPathNotSetException implements Exception {
  const CodexPathNotSetException();
}

class CodexAlreadyRunningException implements Exception {
  final String? detectedPath;

  const CodexAlreadyRunningException(this.detectedPath);
}
