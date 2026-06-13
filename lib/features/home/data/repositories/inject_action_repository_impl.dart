import 'package:shim/features/home/data/datasources/inject_action_datasource.dart';
import 'package:shim/features/home/domain/repositories/inject_action_repository.dart';

class InjectActionRepositoryImpl implements InjectActionRepository {
  final InjectActionDatasource _dataSource;

  InjectActionRepositoryImpl({required InjectActionDatasource dataSource})
      : _dataSource = dataSource;

  @override
  Future<bool> isDebugPortAlive({required int debugPort}) {
    return _dataSource.isDebugPortAlive(debugPort);
  }

  @override
  Future<void> launchExecutable({
    required String executablePath,
    required int debugPort,
  }) {
    return _dataSource.launchExecutable(
      executablePath: executablePath,
      debugPort: debugPort,
    );
  }

  @override
  Future<void> waitForDebugPort({required int debugPort}) {
    return _dataSource.waitForDebugPort(debugPort: debugPort);
  }

  @override
  Future<void> injectScript({
    required int debugPort,
    required String script,
  }) {
    return _dataSource.injectScript(debugPort: debugPort, script: script);
  }
}
