import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_flutter/src/feature/auth/screens/account_screen.dart';
import 'package:listie2_flutter/src/feature/auth/screens/auth_screen.dart';
import 'package:listie2_flutter/src/feature/nav/app_container.dart';
import 'package:listie2_flutter/src/utils/singletons.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initSingletons();
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
      ),
      // home: AppContainer(),
      routes: {
        '/': (context) => AppContainer(),
        AccountScreen.routeName: (context) => AccountScreen(),
      },
    );
  }
}
