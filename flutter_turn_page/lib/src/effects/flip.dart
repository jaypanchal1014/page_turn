import 'package:flutter/material.dart';

class FlipEffect extends StatelessWidget {
  final Widget child;
  final Axis axis;
  final double value;

  const FlipEffect({
    super.key,
    required this.child,
    required this.value,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    final rotation = value.clamp(-1, 1);

    if (axis == Axis.horizontal) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(rotation * 1.2),
        child: child,
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(rotation * 1.2),
        child: child,
      );
    }
  }
}
