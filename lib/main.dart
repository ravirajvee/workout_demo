import 'package:assesment_ravindra/data/values/app_string.dart';
import 'package:assesment_ravindra/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: AppTheme.appTheme,
      home: const HomePage(),
    );
  }
}
