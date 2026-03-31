import 'package:flutter/material.dart';

class SlideEffect extends StatelessWidget {
  final Widget child;
  final double value;
  final Axis axis;

  const SlideEffect({
    super.key,
    required this.child,
    required this.value,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    final offset = value.clamp(-1.0, 1.0);
    final scale = 1 - (offset.abs() * 0.1);

    if (axis == Axis.horizontal) {
      return Transform.translate(
        offset: Offset(offset * 80, 0),
        child: Transform.scale(scale: scale, child: child),
      );
    } else {
      return Transform.translate(
        offset: Offset(0, offset * 80),
        child: Transform.scale(scale: scale, child: child),
      );
    }
  }
}
