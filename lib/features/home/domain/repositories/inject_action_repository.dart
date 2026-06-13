abstract class InjectActionRepository {
  /// 在指定调试端口的页面里执行一段 JS
  Future<void> injectScript({
    required int debugPort,
    required String script,
  });
}
