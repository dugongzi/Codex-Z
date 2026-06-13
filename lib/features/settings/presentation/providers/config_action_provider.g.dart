// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(configActionRepository)
const configActionRepositoryProvider = ConfigActionRepositoryProvider._();

final class ConfigActionRepositoryProvider
    extends
        $FunctionalProvider<
          ConfigActionRepository,
          ConfigActionRepository,
          ConfigActionRepository
        >
    with $Provider<ConfigActionRepository> {
  const ConfigActionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configActionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configActionRepositoryHash();

  @$internal
  @override
  $ProviderElement<ConfigActionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConfigActionRepository create(Ref ref) {
    return configActionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConfigActionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConfigActionRepository>(value),
    );
  }
}

String _$configActionRepositoryHash() =>
    r'd9dd5c3f71da31bd2a737b488775901df3e9c3f5';

@ProviderFor(setCodexAppPath)
const setCodexAppPathProvider = SetCodexAppPathFamily._();

final class SetCodexAppPathProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const SetCodexAppPathProvider._({
    required SetCodexAppPathFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'setCodexAppPathProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$setCodexAppPathHash();

  @override
  String toString() {
    return r'setCodexAppPathProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return setCodexAppPath(ref, path: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SetCodexAppPathProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$setCodexAppPathHash() => r'5718c44398cd508bfa39e5fb4ea79b1b2091ae40';

final class SetCodexAppPathFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  const SetCodexAppPathFamily._()
    : super(
        retry: null,
        name: r'setCodexAppPathProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SetCodexAppPathProvider call({required String path}) =>
      SetCodexAppPathProvider._(argument: path, from: this);

  @override
  String toString() => r'setCodexAppPathProvider';
}
