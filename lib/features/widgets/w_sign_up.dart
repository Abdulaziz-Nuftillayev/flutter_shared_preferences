import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WSignUp extends StatelessWidget {
  const WSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 16,
        ),
      ),
      onPressed: () {},
    );
  }
}
