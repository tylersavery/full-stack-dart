/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Ingredient extends _i1.SerializableEntity {
  Ingredient({
    this.id,
    required this.userId,
    required this.name,
    required this.categoryId,
    required this.isChecked,
  });

  factory Ingredient.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Ingredient(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      categoryId: serializationManager
          .deserialize<int>(jsonSerialization['categoryId']),
      isChecked: serializationManager
          .deserialize<bool>(jsonSerialization['isChecked']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String name;

  int categoryId;

  bool isChecked;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'categoryId': categoryId,
      'isChecked': isChecked,
    };
  }
}
