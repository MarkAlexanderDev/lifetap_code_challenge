import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
