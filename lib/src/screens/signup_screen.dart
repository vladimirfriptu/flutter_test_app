import 'package:flutter/material.dart';
import '../widgets/auth_screens_container.dart';
import '../widgets/auth_screens_title.dart';
import '../widgets/signup_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthScreensContainer(
      children: [
        Center(
            child: AuthScreensTitle(title: 'Sign up')
        ),
        SignupFormWidget()
      ],
    );
  }
}