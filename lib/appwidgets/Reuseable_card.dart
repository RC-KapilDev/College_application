import 'package:flutter/material.dart';

class Reusablecard extends StatelessWidget {
  final Color color;
  final Widget child;
  final double? width;
  final double? height;
  const Reusablecard(
      {super.key,
      required this.color,
      required this.child,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
