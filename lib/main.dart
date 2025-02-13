import 'package:flutter/material.dart';
import 'package:snap_look/config/injector.dart';
import 'package:snap_look/config/theme/app_theme.dart';
import 'package:snap_look/config/routing/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injector.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
