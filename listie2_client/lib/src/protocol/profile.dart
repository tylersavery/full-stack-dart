/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Profile extends _i1.SerializableEntity {
  Profile({
    this.id,
    required this.userId,
    required this.avatarUrl,
    required this.bio,
  });

  factory Profile.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Profile(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      avatarUrl: serializationManager
          .deserialize<String>(jsonSerialization['avatarUrl']),
      bio: serializationManager.deserialize<String>(jsonSerialization['bio']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String avatarUrl;

  String bio;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'avatarUrl': avatarUrl,
      'bio': bio,
    };
  }
}
