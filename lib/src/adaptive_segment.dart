import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'utils/axis_alignment.dart';

extension AdaptiveSegmentedButton on SegmentedButton {
  Widget adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      return CupertinoSegmentedControl<Object>(
        groupValue: selected,
        children: segments.asMap() as Map<Object, Widget>,
        onValueChanged: onSelectionChanged as void Function(Object),
      );
    }
    return this;
  }
}
