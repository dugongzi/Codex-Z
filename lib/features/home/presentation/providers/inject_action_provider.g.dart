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
