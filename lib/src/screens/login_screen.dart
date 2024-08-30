import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFECEFF6),
              Color(0xFFD8E4F2),
            ],
          ),
        ),
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: const Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 40.0),
                            child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Color(0xFF4A4E71),
                                  fontSize: 28.0,
                                  height: 1.0,
                                  fontWeight: FontWeight.w700
                              ),
                            )
                        ),
                        LoginFormWidget()
                      ]
                  ),
                )
              ],
            )
        )
      ),
    );
  }
}