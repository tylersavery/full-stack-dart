import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listie2_flutter/src/feature/asset/services/asset_service.dart';
import 'package:listie2_flutter/src/feature/core/models/session.dart';
import 'package:listie2_flutter/src/utils/api_client.dart';
import 'package:listie2_flutter/src/utils/singletons.dart';
import 'package:listie2_flutter/src/utils/strings.dart';

class SessionProvider extends StateNotifier<Session> {
  final Ref ref;

  final sessionManager = singleton<ApiClient>().sessionManager;
  final client = singleton<ApiClient>().client;

  SessionProvider(this.ref, Session initial) : super(initial) {
    init();
  }

  init() {
    updateUser();
  }

  updateUser() async {
    final user = sessionManager.signedInUser;
    final profile = await client.profile.me();
    state = state.copyWith(user: user, profile: profile);
  }

  logout() async {
    await sessionManager.signOut();
    updateUser();
  }

  Future<bool> updateAvatar(XFile image) async {
    if (!state.isAuthenticated) {
      return false;
    }

    final ext = image.path.split(".").last;
    final path = "avatars/${generateRandomString(12)}.$ext";

    final url = await AssetService().uploadImage(image, path);

    if (url != null) {
      await client.profile.updateAvatar(url);
      updateUser();
      return true;
    }

    return false;
  }
}

final sessionProvider = StateNotifierProvider<SessionProvider, Session>(
  (ref) => SessionProvider(ref, Session()),
);
