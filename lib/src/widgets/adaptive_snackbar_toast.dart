import 'dart:io' show Platform;

import 'package:flutter/material.dart';

/// Return Toast-like [SnackBar] on [Platform.isIOS], [Platform.isMacOS]
///
/// ```dart
/// SnackBar(
///   SnackBar values
/// ).adaptive(SnackBar values)
/// ```
extension AdaptiveSnackBar on SnackBar {
  ///```dart
  ///
  /// if (Platform.isIOS || Platform.isMacOS) {
  ///   return toast-like snackbar
  /// else
  ///   return SnackBar
  ///```
  SnackBar adaptive({
    ShapeBorder? shape,
    Duration? duration,
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      final borderShape = shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          );
      return SnackBar(
        duration: duration ?? const Duration(milliseconds: 4000),
        content: content,
        shape: borderShape,
        behavior: SnackBarBehavior.floating,
      );
    }
    return this;
  }
}
