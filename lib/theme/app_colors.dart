import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const primary900 = Color(0xFF5d3b26);
  static const primary800 = Color(0xFF6c4527);
  static const primary700 = Color(0xFF7c5e24);
  static const primary600 = Color(0xFF92722a);
  static const primaryColor = Color(0xFFB68A35); //500
  static const primary400 = Color(0xFFcba344);
  static const primary300 = Color(0xFFd7bc6d);
  static const primary200 = Color(0xFFe6d7a2);
  static const primary100 = Color(0xFFf2eccf);
  static const primary50 = Color(0xFFf9f7ed);
  static const silver = Color.fromRGBO(209, 211, 212, 1);
  static const white = Color(0xFFffffff);
  static const backgroundColor = Color(0xFFF6F3F3);
  static const cardColor = Color(0xFFffffff);

  static const black = Color(0xFF000000);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
