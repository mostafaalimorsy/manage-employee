import 'package:flutter/material.dart';
import 'package:mostafamorsy/core/app_exports/app_export.dart';
import 'package:mostafamorsy/core/utils/app_size/app_size.dart';

class LightTheme {
  LightTheme._internal();

  static ThemeData lightTheme = ThemeData(
    fontFamily: "Roboto",
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: getFontSize(18),
          fontFamily: "Roboto",
          fontWeight: FontWeight.w500),
    ),
    useMaterial3: true,
  );
}
