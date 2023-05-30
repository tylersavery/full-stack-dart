import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_flutter/src/feature/auth/screens/account_screen.dart';
import 'package:listie2_flutter/src/feature/core/components/base_component.dart';
import 'package:listie2_flutter/src/feature/core/providers/session_provider.dart';

class AccountDropdown extends BaseComponent {
  const AccountDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);

    if (!session.isAuthenticated) {
      return SizedBox();
    }

    return PopupMenuButton(
      child: Row(
        children: [Text(session.user!.userName), Icon(Icons.arrow_drop_down)],
      ),
      itemBuilder: (_) {
        return [
          PopupMenuItem(
            child: Text("My Account"),
            onTap: () {
              Future.delayed(Duration(milliseconds: 100)).then((_) {
                Navigator.of(context).pushNamed(AccountScreen.routeName);
              });
            },
          ),
          PopupMenuItem(
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.red.shade300),
            ),
            onTap: () {
              ref.read(sessionProvider.notifier).logout();
            },
          ),
        ];
      },
    );
  }
}
