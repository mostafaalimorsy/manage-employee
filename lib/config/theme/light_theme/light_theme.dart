import 'package:flutter/material.dart';
import 'package:mostafamorsy/core/app_exports/app_export.dart';

class LightTheme{
  LightTheme._internal();

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: true,
  );
}