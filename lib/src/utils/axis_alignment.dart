import 'package:flutter/material.dart';

class AxisAlign {
  AxisAlign(
    mainAxisAlignment,
    crossAxisAlignment,
  );
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center;
}

/// return MainAxisAlign & CrossAxisAlign
/// from left to right
AxisAlign alignmentToRightRowAxisAlign(Alignment alignment) {
  switch (alignment) {
    case Alignment.bottomCenter:
      return AxisAlign(MainAxisAlignment.center, CrossAxisAlignment.end);
    case Alignment.bottomLeft:
      return AxisAlign(MainAxisAlignment.start, CrossAxisAlignment.end);
    case Alignment.bottomRight:
      return AxisAlign(MainAxisAlignment.end, CrossAxisAlignment.end);
    case Alignment.center:
      return AxisAlign(MainAxisAlignment.center, CrossAxisAlignment.center);
    case Alignment.centerLeft:
      return AxisAlign(MainAxisAlignment.start, CrossAxisAlignment.center);
    case Alignment.centerRight:
      return AxisAlign(MainAxisAlignment.end, CrossAxisAlignment.center);
    case Alignment.topCenter:
      return AxisAlign(MainAxisAlignment.center, CrossAxisAlignment.start);
    case Alignment.topLeft:
      return AxisAlign(MainAxisAlignment.start, CrossAxisAlignment.start);
    case Alignment.topRight:
      return AxisAlign(MainAxisAlignment.end, CrossAxisAlignment.start);
    default:
      return AxisAlign(MainAxisAlignment.center, CrossAxisAlignment.center);
  }
}
