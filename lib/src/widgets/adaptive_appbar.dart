import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// [Automatic platform adaptations]
/// https://docs.flutter.dev/platform-integration/platform-adaptations
extension AdaptiveAppBar on AppBar {
  AppBar adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      //     this.
      // return this.(
      //   surfaceTintColor: Platform.isIOS ? Colors.transparent : null,
      //   shadowColor: Platform.isIOS ? CupertinoColors.darkBackgroundGray : null,
      //   scrolledUnderElevation: Platform.isIOS ? .1 : null,
      //   toolbarHeight: Platform.isIOS ? 44 : null,
      // );
    }
    return this;
  }
}
