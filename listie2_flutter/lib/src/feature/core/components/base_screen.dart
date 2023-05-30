import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseScreen extends ConsumerWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar(context, ref),
      body: body(context, ref),
      floatingActionButton: floatingActionButton(context, ref),
      bottomNavigationBar: bottomNavigationBar(context, ref),
    );
  }

  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return null;
  }

  FloatingActionButton? floatingActionButton(BuildContext context, WidgetRef ref) {
    return null;
  }

  Widget? bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return null;
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return SizedBox();
  }
}
