import 'package:shim/features/home/data/datasources/inject_action_datasource.dart';
import 'package:shim/features/home/domain/repositories/inject_action_repository.dart';

class InjectActionRepositoryImpl implements InjectActionRepository {
  final InjectActionDatasource _dataSource;

  InjectActionRepositoryImpl({required InjectActionDatasource dataSource})
      : _dataSource = dataSource;

  @override
  Future<void> injectScript({
    required int debugPort,
    required String script,
  }) async {
    await _dataSource.injectScript(debugPort: debugPort, script: script);
  }
}
