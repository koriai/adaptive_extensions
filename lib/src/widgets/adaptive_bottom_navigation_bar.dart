import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Return [CupertinoTabBar] on [Platform.isIOS], [Platform.isMacOS]
///
/// ```dart
/// BottomNavigationBar(
///   BottomNavigationBar values
/// ).adaptive(CupertinoTabBar values)
/// ```
extension AdaptiveTabBar on BottomNavigationBar {
  ///
  ///
  /// ```dart
  /// if ([Platform.isIOS] || [Platform.isMacOS])
  ///   return CupertinoTabBar
  /// else
  ///   return BottomNavigationBar
  /// ```
  Widget adaptive({
    Color? backgroundColor,
    Color? activeColor,
    Color inactiveColor = CupertinoColors.inactiveGray,
    double iconSize = 30.0,
    double height = 50.0,
    Border border = const Border(
      top: BorderSide(
        color: CupertinoDynamicColor.withBrightness(
          color: Color(0x4D000000),
          darkColor: Color(0x29000000),
        ),
        width: 0, // 0.0 means one physical pixel
      ),
    ),
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    assert(
      items.length >= 2,
      "Tabs need at least 2 items to conform to Apple's HIG",
    );
    assert(0 <= currentIndex && currentIndex < items.length, 'invalid index');
    assert(height >= 0.0, 'height should be plus');
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      return CupertinoTabBar(
        items: items,
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: backgroundColor,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        iconSize: iconSize,
        height: height,
        border: border,
      );
    }
    return this;
  }
}
