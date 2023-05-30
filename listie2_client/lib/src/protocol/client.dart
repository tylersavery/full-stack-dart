/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:listie2_client/src/protocol/category.dart' as _i3;
import 'package:listie2_client/src/protocol/ingredient.dart' as _i4;
import 'package:listie2_client/src/protocol/profile.dart' as _i5;
import 'package:serverpod_auth_client/module.dart' as _i6;
import 'dart:io' as _i7;
import 'protocol.dart' as _i8;

class _EndpointAsset extends _i1.EndpointRef {
  _EndpointAsset(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'asset';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'asset',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'asset',
        'verifyUpload',
        {'path': path},
      );
}

class _EndpointCategory extends _i1.EndpointRef {
  _EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  _i2.Future<List<_i3.Category>> listAll() =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'listAll',
        {},
      );
}

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello({required String name}) =>
      caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class _EndpointIngredient extends _i1.EndpointRef {
  _EndpointIngredient(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ingredient';

  _i2.Future<List<_i4.Ingredient>> listAll() =>
      caller.callServerEndpoint<List<_i4.Ingredient>>(
        'ingredient',
        'listAll',
        {},
      );

  _i2.Future<List<_i4.Ingredient>> category(int categoryId) =>
      caller.callServerEndpoint<List<_i4.Ingredient>>(
        'ingredient',
        'category',
        {'categoryId': categoryId},
      );

  _i2.Future<bool> create({
    required String name,
    required int categoryId,
    required bool isChecked,
  }) =>
      caller.callServerEndpoint<bool>(
        'ingredient',
        'create',
        {
          'name': name,
          'categoryId': categoryId,
          'isChecked': isChecked,
        },
      );

  _i2.Future<_i4.Ingredient?> toggleIsChecked(int itemId) =>
      caller.callServerEndpoint<_i4.Ingredient?>(
        'ingredient',
        'toggleIsChecked',
        {'itemId': itemId},
      );

  _i2.Future<_i4.Ingredient?> rename({
    required int ingredientId,
    required String name,
  }) =>
      caller.callServerEndpoint<_i4.Ingredient?>(
        'ingredient',
        'rename',
        {
          'ingredientId': ingredientId,
          'name': name,
        },
      );

  _i2.Future<bool> delete(int itemId) => caller.callServerEndpoint<bool>(
        'ingredient',
        'delete',
        {'itemId': itemId},
      );
}

class _EndpointProfile extends _i1.EndpointRef {
  _EndpointProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  _i2.Future<_i5.Profile?> retrieve(int userId) =>
      caller.callServerEndpoint<_i5.Profile?>(
        'profile',
        'retrieve',
        {'userId': userId},
      );

  _i2.Future<_i5.Profile?> me() => caller.callServerEndpoint<_i5.Profile?>(
        'profile',
        'me',
        {},
      );

  _i2.Future<bool> updateAvatar(String avatarUrl) =>
      caller.callServerEndpoint<bool>(
        'profile',
        'updateAvatar',
        {'avatarUrl': avatarUrl},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i7.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i8.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    asset = _EndpointAsset(this);
    category = _EndpointCategory(this);
    example = _EndpointExample(this);
    ingredient = _EndpointIngredient(this);
    profile = _EndpointProfile(this);
    modules = _Modules(this);
  }

  late final _EndpointAsset asset;

  late final _EndpointCategory category;

  late final _EndpointExample example;

  late final _EndpointIngredient ingredient;

  late final _EndpointProfile profile;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'asset': asset,
        'category': category,
        'example': example,
        'ingredient': ingredient,
        'profile': profile,
      };
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
