import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

extension ListTileAdaptive on ListTile {
  /// [Platform.isIOS] || [Platform.isMacOS]
  /// => [CupertinoButton.filled]
  Widget adaptive() {
    assert(title != null);
    if (Platform.isIOS || Platform.isMacOS) {
      return CupertinoListTile(
        title: title!,
        subtitle: subtitle,
        leading: leading,
        trailing: trailing,
      );
    } else {
      return this;
    }
  }
}
