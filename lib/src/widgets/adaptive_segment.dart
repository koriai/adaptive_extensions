import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Return [CupertinoSegmentedControl] on [Platform.isIOS], [Platform.isMacOS]
///
/// ```dart
/// SegmentedButton(
///   SegmentedButton values
/// ).adaptive(CupertinoSegmentedControl values)
/// ```
extension AdaptiveSegmentedButton on SegmentedButton {
  ///```dart
  ///
  /// if (Platform.isIOS || Platform.isMacOS) {
  ///   return SegmentedButton
  /// else
  ///   return CupertinoSegmentedControl
  ///```
  Widget adaptive({
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
      final cupertinoSegments = {
        for (final ButtonSegment buttonSegment in segments)
          buttonSegment.value as Object: buttonSegment.icon!,
      };
      // for (final segment in cupertinoSegments.entries) {
      // if (selected.contains(segment.key)) {
      //   cupertinoSegments.add(segment);
      // }
      // }

      return CupertinoSegmentedControl<Object>(
        groupValue: selected.first,
        children: cupertinoSegments,
        // ignore: cast_nullable_to_non_nullable
        onValueChanged: (_) => onSelectionChanged as void Function(Object),
      );
    }
    return this;
  }
}
