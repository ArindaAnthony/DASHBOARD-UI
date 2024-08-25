import 'package:anthony/constants/variables.dart';
import 'package:flutter/material.dart';
class Customcard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const Customcard({super.key, required this.child,  this.padding, this.color});
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: color?? cardBackgroundColor,
      ),
      child: Padding(
        padding: padding??const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
