import 'package:flutter/material.dart';
import 'package:mostafamorsy/config/routes/app_routes.dart';
import 'package:mostafamorsy/config/theme/light_theme/light_theme.dart';

import 'feature/home/presentation/ui/screen/homeScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.lightTheme,
      onGenerateRoute: RouteGenerator.getRoute,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}