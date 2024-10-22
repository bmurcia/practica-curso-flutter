import 'package:flutter/material.dart';

final themeDataApp = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 20, 72, 168),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
    ),
  ),
);