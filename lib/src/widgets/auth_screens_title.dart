import 'package:flutter/material.dart';

class AuthScreensTitle extends StatelessWidget {
  final String title;

  const AuthScreensTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF4A4E71),
            fontSize: 28.0,
            height: 1,
            fontWeight: FontWeight.w700,
          ),
        )
    );
  }
}