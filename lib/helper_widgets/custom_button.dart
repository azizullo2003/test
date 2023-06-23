import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;

  const CustomButton({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 130,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(32, 241, 192, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),

          ),
        ),
        child: child,
      ),
    );
  }
}
