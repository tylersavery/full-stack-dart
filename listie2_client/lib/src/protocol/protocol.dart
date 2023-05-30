/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'category.dart' as _i2;
import 'example.dart' as _i3;
import 'ingredient.dart' as _i4;
import 'profile.dart' as _i5;
import 'package:listie2_client/src/protocol/category.dart' as _i6;
import 'package:listie2_client/src/protocol/ingredient.dart' as _i7;
import 'package:serverpod_auth_client/module.dart' as _i8;
export 'category.dart';
export 'example.dart';
export 'ingredient.dart';
export 'profile.dart';
export 'client.dart'; // ignore_for_file: equal_keys_in_map

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Category) {
      return _i2.Category.fromJson(data, this) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data, this) as T;
    }
    if (t == _i4.Ingredient) {
      return _i4.Ingredient.fromJson(data, this) as T;
    }
    if (t == _i5.Profile) {
      return _i5.Profile.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Category?>()) {
      return (data != null ? _i2.Category.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Ingredient?>()) {
      return (data != null ? _i4.Ingredient.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Profile?>()) {
      return (data != null ? _i5.Profile.fromJson(data, this) : null) as T;
    }
    if (t == List<_i6.Category>) {
      return (data as List).map((e) => deserialize<_i6.Category>(e)).toList()
          as dynamic;
    }
    if (t == List<_i7.Ingredient>) {
      return (data as List).map((e) => deserialize<_i7.Ingredient>(e)).toList()
          as dynamic;
    }
    try {
      return _i8.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i8.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Category) {
      return 'Category';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.Ingredient) {
      return 'Ingredient';
    }
    if (data is _i5.Profile) {
      return 'Profile';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i8.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Category') {
      return deserialize<_i2.Category>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'Ingredient') {
      return deserialize<_i4.Ingredient>(data['data']);
    }
    if (data['className'] == 'Profile') {
      return deserialize<_i5.Profile>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
