import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_flutter/src/feature/auth/screens/auth_screen.dart';
import 'package:listie2_flutter/src/feature/core/components/base_component.dart';
import 'package:listie2_flutter/src/feature/core/providers/session_provider.dart';
import 'package:listie2_flutter/src/feature/nav/dashboard_container.dart';

class AppContainer extends BaseComponent {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(sessionProvider).isAuthenticated ? DashboardContainer() : AuthScreen();
  }
}
