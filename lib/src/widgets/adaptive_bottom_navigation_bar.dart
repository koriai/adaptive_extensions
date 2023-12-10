import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ```dart
///
/// ```
extension AdaptiveTabBar on BottomNavigationBar {
  ///
  Widget adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      return CupertinoTabBar(
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
      );
    }
    return this;
  }
}
