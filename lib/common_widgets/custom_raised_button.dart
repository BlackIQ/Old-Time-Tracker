import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton({
    required this.child,
    required this.color,
    required this.onPressed,
  });

  final Widget child;
  final Color color;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
