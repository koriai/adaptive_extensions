import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'adaptive_bottom_navigation_bar.dart';

/// Return [CupertinoTabBar] on [Platform.isIOS], [Platform.isMacOS]
///
/// ```dart
/// BottomNavigationBar(
///   BottomNavigationBar values
/// ).adaptive(CupertinoTabBar values)
/// ```
extension AdaptiveScaffold on Scaffold {
  ///
  ///
  /// ```dart
  /// if ([Platform.isIOS] || [Platform.isMacOS])
  ///   return CupertinoTabBar
  /// else
  ///   return BottomNavigationBar
  /// ```
  Widget adaptive({
    List<Widget>? pages,
    String? previousPageTitle,
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    assert(
      appBar != null || bottomNavigationBar != null,
      'one of both must not null',
    );
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      if (appBar != null) {
        assert(appBar.runtimeType == AppBar, 'use Appbar type for appbar');
        final inAppBar = appBar! as AppBar;
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: inAppBar.leading,
            middle: inAppBar.title,
            trailing: inAppBar.actions != null
                ? Row(children: inAppBar.actions!)
                : null,
            previousPageTitle: previousPageTitle,
          ),
          child: body ?? const SizedBox(),
        );
      }
      if (bottomNavigationBar != null) {
        assert(
          bottomNavigationBar.runtimeType != BottomNavigationBar,
          'use Appbar type for appbar',
        );
        assert(
          pages!.length >= 2,
          'CupertinoTabScaffold need more than 1 page',
        );
        final bottomBar = bottomNavigationBar! as BottomNavigationBar;
        return CupertinoTabScaffold(
          tabBar: bottomBar.adaptive() as CupertinoTabBar,
          tabBuilder: (BuildContext context, int index) => pages![index],
        );
      }
    }
    return this;
  }
}
