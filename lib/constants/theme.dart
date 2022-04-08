import 'package:flutter/material.dart';

final theme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
  primaryColor: Colors.greenAccent,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(shadowColor: Colors.blue),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.green,
  primaryColor: Colors.greenAccent,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(shadowColor: Colors.blue),
  ),
);
