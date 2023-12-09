import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
extension AdaptiveSnackBar on SnackBar {
  SnackBar adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      return SnackBar(
        content: content,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        behavior: SnackBarBehavior.floating,
      );
    }
    return this;
  }
}
