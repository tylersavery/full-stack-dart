import 'package:listie2_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ProfileEndpoint extends Endpoint {
  Future<Profile?> retrieve(Session session, int userId) async {
    return await Profile.findSingleRow(session, where: (p) => p.userId.equals(userId));
  }

  Future<Profile?> me(Session session) async {
    final userId = await session.auth.authenticatedUserId;
    if (userId == null) {
      return null;
    }

    final profile = await Profile.findSingleRow(session, where: (p) => p.userId.equals(userId));
    if (profile != null) {
      return profile;
    }

    final newProfile = Profile(userId: userId, avatarUrl: "", bio: "");
    await Profile.insert(session, newProfile);
    return newProfile;
  }

  Future<bool> updateAvatar(Session session, String avatarUrl) async {
    final profile = await me(session);

    if (profile != null) {
      profile.avatarUrl = avatarUrl;
      await Profile.update(session, profile);
      return true;
    }

    return false;
  }
}
