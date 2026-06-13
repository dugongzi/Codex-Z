import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shim/features/home/data/datasources/inject_action_datasource.dart';
import 'package:shim/features/home/data/repositories/inject_action_repository_impl.dart';
import 'package:shim/features/home/domain/repositories/inject_action_repository.dart';
import 'package:shim/features/settings/presentation/providers/config_query_provider.dart';

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
Future<void> injectScript(
  Ref ref, {
  required int debugPort,
  required String script,
}) async {
  await ref
      .read(injectActionRepositoryProvider)
      .injectScript(debugPort: debugPort, script: script);
}

/// 完整流程：检查路径 → 检查端口 → 启动 → 等就绪 → 注入
@riverpod
Future<void> launchAndInject(
  Ref ref, {
  required int debugPort,
  required String script,
}) async {
  final path = await ref.read(codexAppPathProvider.future);
  if (path == null || path.isEmpty) {
    throw const CodexPathNotSetException();
  }

  final repo = ref.read(injectActionRepositoryProvider);
  if (await repo.isDebugPortAlive(debugPort: debugPort)) {
    throw const CodexAlreadyRunningException();
  }

  await repo.launchExecutable(executablePath: path, debugPort: debugPort);
  await repo.waitForDebugPort(debugPort: debugPort);
  await repo.injectScript(debugPort: debugPort, script: script);
}

class CodexPathNotSetException implements Exception {
  const CodexPathNotSetException();
}

class CodexAlreadyRunningException implements Exception {
  const CodexAlreadyRunningException();
}
