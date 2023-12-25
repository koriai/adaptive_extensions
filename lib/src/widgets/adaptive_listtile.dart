import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// These constants were eyeballed from iOS 14.4 Settings app for base, Notes for
// notched without leading, and Reminders app for notched with leading.
const double _kLeadingSize = 28;
const EdgeInsetsDirectional _kPadding =
    EdgeInsetsDirectional.only(start: 20, end: 14);
const double _kLeadingToTitle = 16;

/// Return [CupertinoListTile] on [Platform.isIOS], [Platform.isMacOS]
///
/// ```dart
/// ListTile(
///   ListTile values
/// ).adaptive(CupertinoListTile values)
/// ```
extension AdaptiveListTile on ListTile {
  /// ```dart
  /// if ([Platform.isIOS] || [Platform.isMacOS]){
  ///   if (isNotched)
  ///     return CupertinoListTile.notched();
  ///    return CupertinoListTile();
  /// }
  /// ```
  Widget adaptive({
    CupertinoThemeData? cupertinoThemeData,
    bool forceCupertino = false,
    bool forceMaterial = false,
    bool isNotched = false,
    bool isChevron = false,
    EdgeInsetsDirectional padding = _kPadding,
    double leadingSize = _kLeadingSize,
    double leadingToTitle = _kLeadingToTitle,
    Widget? additionalInfo,
    Color? backgroundColor,
    Color? backgroundColorActivated,
  }) {
    assert(title != null, '');
    assert(!(forceCupertino && forceMaterial), '');
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
                leadingSize: leadingSize,
                leadingToTitle: leadingToTitle,
                padding: padding,
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
                leadingSize: leadingSize,
                leadingToTitle: leadingToTitle,
                padding: padding,
              ),
      );
    } else {
      // return listtile itself
      return this;
    }
  }
}
