// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inject_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(injectActionDatasource)
const injectActionDatasourceProvider = InjectActionDatasourceProvider._();

final class InjectActionDatasourceProvider
    extends
        $FunctionalProvider<
          InjectActionDatasource,
          InjectActionDatasource,
          InjectActionDatasource
        >
    with $Provider<InjectActionDatasource> {
  const InjectActionDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'injectActionDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$injectActionDatasourceHash();

  @$internal
  @override
  $ProviderElement<InjectActionDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InjectActionDatasource create(Ref ref) {
    return injectActionDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InjectActionDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InjectActionDatasource>(value),
    );
  }
}

String _$injectActionDatasourceHash() =>
    r'ba24ef75681fa6f09db3b94f6526603aefaff074';

@ProviderFor(injectActionRepository)
const injectActionRepositoryProvider = InjectActionRepositoryProvider._();

final class InjectActionRepositoryProvider
    extends
        $FunctionalProvider<
          InjectActionRepository,
          InjectActionRepository,
          InjectActionRepository
        >
    with $Provider<InjectActionRepository> {
  const InjectActionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'injectActionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$injectActionRepositoryHash();

  @$internal
  @override
  $ProviderElement<InjectActionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InjectActionRepository create(Ref ref) {
    return injectActionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InjectActionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InjectActionRepository>(value),
    );
  }
}

String _$injectActionRepositoryHash() =>
    r'ed4671c248cbafb86a09b05302d35c9d7ecee212';

@ProviderFor(isDebugPortAlive)
const isDebugPortAliveProvider = IsDebugPortAliveFamily._();

final class IsDebugPortAliveProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const IsDebugPortAliveProvider._({
    required IsDebugPortAliveFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'isDebugPortAliveProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isDebugPortAliveHash();

  @override
  String toString() {
    return r'isDebugPortAliveProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as int;
    return isDebugPortAlive(ref, debugPort: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsDebugPortAliveProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isDebugPortAliveHash() => r'd9e0a0f5c70e9613650ed7767c0c734467f4a527';

final class IsDebugPortAliveFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, int> {
  const IsDebugPortAliveFamily._()
    : super(
        retry: null,
        name: r'isDebugPortAliveProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsDebugPortAliveProvider call({required int debugPort}) =>
      IsDebugPortAliveProvider._(argument: debugPort, from: this);

  @override
  String toString() => r'isDebugPortAliveProvider';
}

@ProviderFor(launchExecutable)
const launchExecutableProvider = LaunchExecutableFamily._();

final class LaunchExecutableProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const LaunchExecutableProvider._({
    required LaunchExecutableFamily super.from,
    required ({String executablePath, int debugPort}) super.argument,
  }) : super(
         retry: null,
         name: r'launchExecutableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$launchExecutableHash();

  @override
  String toString() {
    return r'launchExecutableProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({String executablePath, int debugPort});
    return launchExecutable(
      ref,
      executablePath: argument.executablePath,
      debugPort: argument.debugPort,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LaunchExecutableProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$launchExecutableHash() => r'6e8fc719f5775e5f5e9d43a7463f3f7c317b8879';

final class LaunchExecutableFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String executablePath, int debugPort})
        > {
  const LaunchExecutableFamily._()
    : super(
        retry: null,
        name: r'launchExecutableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LaunchExecutableProvider call({
    required String executablePath,
    required int debugPort,
  }) => LaunchExecutableProvider._(
    argument: (executablePath: executablePath, debugPort: debugPort),
    from: this,
  );

  @override
  String toString() => r'launchExecutableProvider';
}

@ProviderFor(waitForDebugPort)
const waitForDebugPortProvider = WaitForDebugPortFamily._();

final class WaitForDebugPortProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const WaitForDebugPortProvider._({
    required WaitForDebugPortFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'waitForDebugPortProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$waitForDebugPortHash();

  @override
  String toString() {
    return r'waitForDebugPortProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as int;
    return waitForDebugPort(ref, debugPort: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WaitForDebugPortProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$waitForDebugPortHash() => r'e3ae77d0f76beeb66e9e49bf9760b522a77c7b30';

final class WaitForDebugPortFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, int> {
  const WaitForDebugPortFamily._()
    : super(
        retry: null,
        name: r'waitForDebugPortProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WaitForDebugPortProvider call({required int debugPort}) =>
      WaitForDebugPortProvider._(argument: debugPort, from: this);

  @override
  String toString() => r'waitForDebugPortProvider';
}

@ProviderFor(injectScript)
const injectScriptProvider = InjectScriptFamily._();

final class InjectScriptProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const InjectScriptProvider._({
    required InjectScriptFamily super.from,
    required ({int debugPort, String script}) super.argument,
  }) : super(
         retry: null,
         name: r'injectScriptProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$injectScriptHash();

  @override
  String toString() {
    return r'injectScriptProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({int debugPort, String script});
    return injectScript(
      ref,
      debugPort: argument.debugPort,
      script: argument.script,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is InjectScriptProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$injectScriptHash() => r'f6155363221e0b62e9921139683447a85b149d63';

final class InjectScriptFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({int debugPort, String script})
        > {
  const InjectScriptFamily._()
    : super(
        retry: null,
        name: r'injectScriptProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InjectScriptProvider call({required int debugPort, required String script}) =>
      InjectScriptProvider._(
        argument: (debugPort: debugPort, script: script),
        from: this,
      );

  @override
  String toString() => r'injectScriptProvider';
}

/// 完整流程：检查路径 → 检查端口 → 启动 → 等就绪 → 注入

@ProviderFor(launchAndInject)
const launchAndInjectProvider = LaunchAndInjectFamily._();

/// 完整流程：检查路径 → 检查端口 → 启动 → 等就绪 → 注入

final class LaunchAndInjectProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// 完整流程：检查路径 → 检查端口 → 启动 → 等就绪 → 注入
  const LaunchAndInjectProvider._({
    required LaunchAndInjectFamily super.from,
    required ({int debugPort, String script}) super.argument,
  }) : super(
         retry: null,
         name: r'launchAndInjectProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$launchAndInjectHash();

  @override
  String toString() {
    return r'launchAndInjectProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({int debugPort, String script});
    return launchAndInject(
      ref,
      debugPort: argument.debugPort,
      script: argument.script,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LaunchAndInjectProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$launchAndInjectHash() => r'52664c2aea2fc2fe08fbd70caa86fe28a731ba44';

/// 完整流程：检查路径 → 检查端口 → 启动 → 等就绪 → 注入

final class LaunchAndInjectFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({int debugPort, String script})
        > {
  const LaunchAndInjectFamily._()
    : super(
        retry: null,
        name: r'launchAndInjectProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 完整流程：检查路径 → 检查端口 → 启动 → 等就绪 → 注入

  LaunchAndInjectProvider call({
    required int debugPort,
    required String script,
  }) => LaunchAndInjectProvider._(
    argument: (debugPort: debugPort, script: script),
    from: this,
  );

  @override
  String toString() => r'launchAndInjectProvider';
}
