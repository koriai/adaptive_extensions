import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'utils/axis_alignment.dart';

extension FilledButtonAdaptive on FilledButton {
  /// [Platform.isIOS] || [Platform.isMacOS]
  /// [FilledButton] => [CupertinoButton.filled]
  ///
  ///
  /// To make [Button] with [Icon]
  /// Use [adaptive(icon:Icon)] instead of [FilledButton.icon]
  ///
  /// Except icon, all parameters for [adaptive] is applied to cupertino widget only.
  ///
  /// [padding] : [CupertinoButton]'s padding
  /// [color] :
  Widget adaptive({
    Widget? icon,
    EdgeInsetsGeometry? padding,
    Color? color,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    double? minSize = kMinInteractiveDimensionCupertino,
    double? pressedOpacity = 0.4,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    Alignment alignment = Alignment.center,
    double gap = 8,
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

      return CupertinoTheme(
          data: CupertinoThemeData(),
          child: CupertinoButton.filled(
            padding: padding,
            disabledColor: disabledColor,
            minSize: minSize,
            pressedOpacity: pressedOpacity,
            borderRadius: borderRadius,
            alignment: alignment,
            onPressed: onPressed,
            child: buttonChild,
          ));
    } else {
      if (icon != null) {
        return FilledButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: child!,
        );
      }
      return this;
    }
  }
}
