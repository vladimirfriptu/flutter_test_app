import 'package:flutter/material.dart';
import 'src/screens/signup_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Inter'),
        home: const LoginScreen()
    );
  }
}