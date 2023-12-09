import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/axis_alignment.dart';

extension AdaptiveFilledButton on FilledButton {
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
  /// EdgeInsetsGeometry? padding,
  /// bool isGray = false,
  /// Color? color,
  /// Color disabledColor = CupertinoColors.quaternarySystemFill,
  /// double? minSize = kMinInteractiveDimensionCupertino,
  /// double? pressedOpacity = 0.4,
  /// BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
  /// Alignment alignment = Alignment.center,
  /// double gap = 8,
  /// CupertinoThemeData cupertinoThemeData = const CupertinoThemeData(),
  /// bool forceCupertino = false,
  /// bool forceMaterial = false,
  Widget adaptive({
    Widget? icon,
    AsyncCallback? asyncCallback,
    EdgeInsetsGeometry? padding,
    bool isGray = false,
    bool isTonal = false,
    Color? color,
    Color disabledColor = CupertinoColors.quaternarySystemFill,
    double? minSize = kMinInteractiveDimensionCupertino,
    double? pressedOpacity = 0.4,
    BorderRadius? borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    Alignment alignment = Alignment.center,
    double gap = 8,
    CupertinoThemeData cupertinoThemeData = const CupertinoThemeData(),
    bool forceCupertino = false,
    bool forceMaterial = false,
  }) {
    assert(child.runtimeType == Text);
    assert(!(forceCupertino && forceMaterial));

    /// convert align
    final AxisAlign axisAlign = alignmentToRightRowAxisAlign(alignment);
    final MainAxisAlignment mainAxisAlignment = axisAlign.mainAxisAlignment;
    final CrossAxisAlignment crossAxisAlignment = axisAlign.crossAxisAlignment;

    if ((forceCupertino || Platform.isIOS || Platform.isMacOS) &&
        !forceMaterial) {
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
          data: cupertinoThemeData.copyWith(
            primaryColor: isGray ? disabledColor : color,
          ),
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
      if (isTonal && icon != null) {
        return FilledButton.tonalIcon(
          onPressed: onPressed,
          icon: icon,
          label: child!,
        );
      }
      if (icon != null && !isTonal) {
        return FilledButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: child!,
        );
      }
      if (icon == null && isTonal) {
        return FilledButton.tonal(
          onPressed: onPressed,
          child: child!,
        );
      }
      return this;
    }
  }
}
