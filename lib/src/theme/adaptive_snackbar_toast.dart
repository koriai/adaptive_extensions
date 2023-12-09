import 'dart:io' show Platform;

import 'package:flutter/material.dart';

///
/// This is Snackbar Themedata
/// Add this on your Theme
///
/// [iOS]
/// ㄴ[]
/// ㄴ[SnackBarBehavior.floating]
/// ```dart
/// Theme(
///   SnackbarTheme: SnackBarThemeData().adaptive
/// )
/// ```
extension AdaptiveSnackBarThemeData on SnackBarThemeData {
  SnackBarThemeData adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      return SnackBarThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        behavior: SnackBarBehavior.floating,
      );
    }
    return this;
  }
}
