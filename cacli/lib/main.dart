import 'package:flutter/material.dart';
import 'calculator_screen.dart'; // Import your calculator UI file
import 'app_theme.dart'; // Import your custom theme file

void main() {
  runApp(
    MaterialApp(
      theme: customTheme, // customTheme is defined in app_theme.dart
      home: CalculatorScreen(),
    ),
  );
}
