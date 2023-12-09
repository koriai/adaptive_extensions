import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

extension AdaptiveListTile on ListTile {
  /// [Platform.isIOS] || [Platform.isMacOS]
  /// => [CupertinoButton.filled]
  Widget adaptive({
    CupertinoThemeData? cupertinoThemeData,
    Widget? additionalInfo,
    Color? backgroundColor,
    Color? backgroundColorActivated,
    bool forceCupertino = false,
    bool forceMaterial = false,
    bool isNotched = false,
  }) {
    assert(title != null);
    assert(!(forceCupertino && forceMaterial));
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      return CupertinoTheme(
          data: cupertinoThemeData ?? const CupertinoThemeData(),
          child: isNotched
              ? CupertinoListTile.notched(
                  title: title!,
                  subtitle: subtitle,
                  leading: leading,
                  trailing: trailing,
                  onTap: onTap,
                  additionalInfo: additionalInfo,
                  backgroundColor: backgroundColor ?? tileColor,
                  backgroundColorActivated: backgroundColorActivated,
                )
              : CupertinoListTile(
                  title: title!,
                  subtitle: subtitle,
                  leading: leading,
                  trailing: trailing,
                  onTap: onTap,
                  additionalInfo: additionalInfo,
                  backgroundColor: backgroundColor ?? tileColor,
                  backgroundColorActivated: backgroundColorActivated,
                ));
    } else {
      // return listtile itself
      return this;
    }
  }
}
