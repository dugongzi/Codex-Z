abstract class ConfigActionRepository {
  /// 保存 Codex 可执行文件路径
  Future<void> setCodexAppPath(String path);
}
