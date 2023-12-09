import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
      return CupertinoTabBar(items: items);
    }
    return this;
  }
}
