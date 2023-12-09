import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// This is Snackbar Themedata
/// Add this on your Theme
///
/// ```dart
/// Theme(
///   SnackbarTheme: SnackBarThemeData().adaptive
/// )
/// ```
extension AdaptiveTabScaffold on Scaffold {
  Widget adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    assert(bottomNavigationBar != null, '');
    assert(!(forceCupertino && forceMaterial), '');
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      // return CupertinoTabScaffold(
      //   tabBar:
      //   tabBuilder:
      //   );
    }
    return this;
  }
}
