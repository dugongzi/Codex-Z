abstract class InjectActionRepository {
  /// 端口是否已有 CDP 服务监听
  Future<bool> isDebugPortAlive({required int debugPort});

  /// 启动目标程序并带上调试端口参数
  Future<void> launchExecutable({
    required String executablePath,
    required int debugPort,
  });

  /// 轮询直到端口就绪
  Future<void> waitForDebugPort({required int debugPort});

  /// 在指定调试端口的页面里执行一段 JS
  Future<void> injectScript({
    required int debugPort,
    required String script,
  });
}
