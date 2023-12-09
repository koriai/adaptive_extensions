import 'package:adaptive_extensions/adaptive_extensions.dart';
import 'package:flutter/material.dart';

class MyTheme {
  MyTheme._();
  static final light = ThemeData(
    appBarTheme: const AppBarTheme().adaptive(),
    // snackBarTheme: SnackBarThemeData().adaptive(),
  );
}
