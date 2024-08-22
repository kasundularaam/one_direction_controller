import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "App Title",
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.wasabi),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.wasabi),
      themeMode: ThemeMode.system,
      routerConfig: _router.config(),
    );
  }
}
