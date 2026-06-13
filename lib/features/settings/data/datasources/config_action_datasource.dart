import 'package:shim/core/services/app_storage.dart';

class ConfigActionDatasource {
  static const codexAppPathKey = 'codex_app_path';

  final AppStorage _appStorage;

  ConfigActionDatasource({required AppStorage appStorage})
      : _appStorage = appStorage;

  Future<void> setCodexAppPath(String path) {
    return _appStorage.setString(codexAppPathKey, path);
  }
}
