import 'package:shim/core/services/app_storage.dart';

class ConfigQueryDatasource {
  static const codexAppPathKey = 'codex_app_path';

  final AppStorage _appStorage;

  ConfigQueryDatasource({required AppStorage appStorage})
      : _appStorage = appStorage;

  Future<String?> getCodexAppPath() {
    return _appStorage.getString(codexAppPathKey);
  }
}
