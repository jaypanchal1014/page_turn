import 'package:flutter/material.dart';

class CurlEffect extends StatelessWidget {
  final Widget child;
  final Axis axis;
  final double value;

  const CurlEffect({
    super.key,
    required this.child,
    required this.value,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    final rotation = value.clamp(-1, 1);
    final scale = 1 - (rotation.abs() * 0.15);

    if (axis == Axis.horizontal) {
      return Transform(
        alignment: rotation > 0 ? Alignment.centerLeft : Alignment.centerRight,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(rotation * 0.9),
        child: Transform.scale(scale: scale, child: child),
      );
    } else {
      return Transform(
        alignment: rotation > 0 ? Alignment.topCenter : Alignment.bottomCenter,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateX(rotation * 0.9),
        child: Transform.scale(scale: scale, child: child),
      );
    }
  }
}
