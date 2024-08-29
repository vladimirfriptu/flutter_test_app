import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disabled;

  SubmitButtonWidget({Key? key, required this.onPressed, required this.text, this.disabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      child: Text(text, style: const TextStyle(fontSize: 20)),
    );
  }
}