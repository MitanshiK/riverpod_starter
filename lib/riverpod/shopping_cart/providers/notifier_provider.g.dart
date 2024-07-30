// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartotalHash() => r'0178d21c59990ef6696cdede32ebea3142f15c2c';

/// See also [cartotal].
@ProviderFor(cartotal)
final cartotalProvider = AutoDisposeProvider<int>.internal(
  cartotal,
  name: r'cartotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartotalRef = AutoDisposeProviderRef<int>;
String _$cartChangeNotifierHash() =>
    r'a9b76c450cafc508580d5c68ac6c9f3645c1e26a';

/// See also [CartChangeNotifier].
@ProviderFor(CartChangeNotifier)
final cartChangeNotifierProvider =
    AutoDisposeNotifierProvider<CartChangeNotifier, Set<Product>>.internal(
  CartChangeNotifier.new,
  name: r'cartChangeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartChangeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartChangeNotifier = AutoDisposeNotifier<Set<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
