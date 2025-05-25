import 'package:assesment_ravindra/theme/styles.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static const primaryFont = 'Roboto';
  static const secondaryFont = 'Inter';
  static final appTheme = ThemeData(
    // fontFamily: 'poppins',
    fontFamily: primaryFont,
    useMaterial3: true,
    // scaffoldBackgroundColor: const Color(0xFFE9E9E9),
    // scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    scaffoldBackgroundColor: AppColors.white,
    cardColor: AppColors.cardColor,
    primarySwatch: createMaterialColor(AppColors.primaryColor),
    brightness: Brightness.light,
    radioTheme: RadioThemeData(
      fillColor:
          MaterialStateColor.resolveWith((states) => AppColors.primaryColor),
    ),
    appBarTheme: const AppBarTheme(color: AppColors.white),
    textTheme: const TextTheme(
      displayMedium: Styles.tsBlackBold14,
      bodyMedium: Styles.tsBlackRegular14,
    ).apply(
      bodyColor: AppColors.primary700,
      displayColor: AppColors.primary700,
    ),
  );
}
