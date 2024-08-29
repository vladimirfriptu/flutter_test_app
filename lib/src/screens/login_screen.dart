import 'package:flutter/material.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // linear gradient from top #F4F9FF to bottom #E0EDFB
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF4F9FF),
              Color(0xFFE0EDFB),
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