import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [Automatic platform adaptations]
/// https://docs.flutter.dev/platform-integration/platform-adaptations
extension AdaptiveAppBarThemeData on AppBarTheme {
  AppBarTheme adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      return copyWith(
        surfaceTintColor: Colors.transparent,
        shadowColor: CupertinoColors.darkBackgroundGray,
        scrolledUnderElevation: .1,
        toolbarHeight: 44,
      );
    }
    return this;
  }
}
