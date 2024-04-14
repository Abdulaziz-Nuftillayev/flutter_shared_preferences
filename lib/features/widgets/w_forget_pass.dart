import 'package:flutter/cupertino.dart';

wForgetPass() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      CupertinoButton(
        onPressed: () {},
        child: const Text(
          'Forgot password?',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ],
  );
}
