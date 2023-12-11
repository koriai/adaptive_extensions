import 'package:flutter/material.dart';

({MainAxisAlignment main, CrossAxisAlignment cross}) axisAlign =
    (main: MainAxisAlignment.center, cross: CrossAxisAlignment.center);

/// return MainAxisAlign & CrossAxisAlign
/// from left to right
({MainAxisAlignment main, CrossAxisAlignment cross})
    alignmentToRightRowAxisAlign(
  Alignment alignment,
) {
  switch (alignment) {
    case Alignment.bottomCenter:
      return (main: MainAxisAlignment.center, cross: CrossAxisAlignment.end);
    case Alignment.bottomLeft:
      return (main: MainAxisAlignment.start, cross: CrossAxisAlignment.end);
    case Alignment.bottomRight:
      return (main: MainAxisAlignment.end, cross: CrossAxisAlignment.end);
    case Alignment.center:
      return (main: MainAxisAlignment.center, cross: CrossAxisAlignment.center);
    case Alignment.centerLeft:
      return (main: MainAxisAlignment.start, cross: CrossAxisAlignment.center);
    case Alignment.centerRight:
      return (main: MainAxisAlignment.end, cross: CrossAxisAlignment.center);
    case Alignment.topCenter:
      return (main: MainAxisAlignment.center, cross: CrossAxisAlignment.start);
    case Alignment.topLeft:
      return (main: MainAxisAlignment.start, cross: CrossAxisAlignment.start);
    case Alignment.topRight:
      return (main: MainAxisAlignment.end, cross: CrossAxisAlignment.start);
    default:
      return (main: MainAxisAlignment.center, cross: CrossAxisAlignment.center);
  }
}
