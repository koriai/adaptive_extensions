import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'utils/axis_alignment.dart';

extension TextButtonAdaptive on TextButton {
  /// [Platform.isIOS] || [Platform.isMacOS]
  /// [TextButton] => [CupertinoButton]
  ///
  ///
  /// To make [Button] with [Icon]
  /// Use [adaptive(icon:Icon)] instead of [TextButton.icon]
  ///
  /// [gap] : between icon & widget
  Widget adaptive({
    Widget? icon,
    EdgeInsetsGeometry? padding,
    Color? color,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    double? minSize = kMinInteractiveDimensionCupertino,
    double? pressedOpacity = 0.4,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    Alignment alignment = Alignment.center,
    double? gap = 8.0,
  }) {
    assert(child.runtimeType == Text);

    /// convert align
    final AxisAlign axisAlign = alignmentToRightRowAxisAlign(alignment);
    final MainAxisAlignment mainAxisAlignment = axisAlign.mainAxisAlignment;
    final CrossAxisAlignment crossAxisAlignment = axisAlign.crossAxisAlignment;

    if (Platform.isIOS || Platform.isMacOS) {
      final buttonChild = (icon != null)
          ? Row(
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: <Widget>[
                  icon,
                  SizedBox(width: gap),
                  child!,
                ])
          : child!;

      return CupertinoButton(
        padding: padding,
        color: color,
        disabledColor: disabledColor,
        minSize: minSize,
        pressedOpacity: pressedOpacity,
        borderRadius: borderRadius,
        alignment: alignment,
        onPressed: onPressed,
        child: buttonChild,
      );
    } else {
      // return [TextButton.icon]
      if (icon != null) {
        return TextButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: child!,
        );
      }
      // return [Textbutton]
      return this;
    }
  }
}
