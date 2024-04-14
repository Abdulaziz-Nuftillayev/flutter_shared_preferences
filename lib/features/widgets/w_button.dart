import 'package:flutter/material.dart';

class WButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const WButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPressed,
      child: child,
    );
  }
}
