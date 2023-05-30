import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listie2_flutter/src/feature/asset/services/asset_service.dart';
import 'package:listie2_flutter/src/feature/auth/components/avatar.dart';
import 'package:listie2_flutter/src/feature/core/components/base_screen.dart';
import 'package:listie2_flutter/src/feature/core/providers/session_provider.dart';

class AccountScreen extends BaseScreen {
  static const routeName = '/account';
  const AccountScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("My Account"),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(sessionProvider).profile;

    return ListView(
      children: [
        Card(
          child: ListTile(
            leading: Avatar(profile),
            title: Text(
              "Avatar",
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () async {
              final image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image != null) {
                ref.read(sessionProvider.notifier).updateAvatar(image);
              }
            },
          ),
        ),
        Card(
          child: ListTile(
            iconColor: Colors.red.shade500,
            leading: Icon(Icons.logout),
            title: Text(
              "Logout",
              style: TextStyle(
                color: Colors.red.shade500,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              ref.read(sessionProvider.notifier).logout();
            },
          ),
        ),
      ],
    );
  }
}
