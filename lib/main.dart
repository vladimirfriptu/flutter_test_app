import 'package:flutter/material.dart';
import 'src/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        home: const LoginScreen()
    );
  }
}