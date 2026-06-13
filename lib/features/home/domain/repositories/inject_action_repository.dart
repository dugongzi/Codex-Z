abstract class InjectActionRepository {
  /// 端口是否已有 CDP 服务监听
  Future<bool> isDebugPortAlive({required int debugPort});

  /// 在 page target 上找出 devtools 前端 URL
  Future<String?> findDevtoolsUrl({required int debugPort});

  /// 通过监听端口反查可执行文件路径
  Future<String?> findExecutableByPort({required int debugPort});

  /// 启动目标程序并带上调试端口参数
  Future<void> launchExecutable({
    required String executablePath,
    required int debugPort,
  });

  /// 轮询直到端口出现可注入 page
  Future<void> waitForDebugPort({required int debugPort});

  /// 加载注入脚本（debug 模式优先读外部文件，否则读 asset）
  Future<String> loadInjectScript();

  /// 在指定调试端口的页面里执行一段 JS
  Future<void> injectScript({
    required int debugPort,
    required String script,
  });
}
