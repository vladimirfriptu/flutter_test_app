import 'package:flutter/material.dart';
import 'submit_button.dart';
import 'form_field_widget.dart';
import 'form_password_field_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  String _email = '';
  String _password = '';

  String _emailError = '';
  String _passwordError = '';
  bool _isTouched = false;

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final int _passwordMinLength = 8;
  final int _passwordMaxLength = 64;
  final RegExp _emailUpperCase = RegExp(r'[A-Z]');
  final RegExp _emailNumber = RegExp(r'[0-9]');

  void _validateEmail() {
    String error = '';

    if (_email.isEmpty) {
      error = 'Email is required';
    } else if (!_emailRegex.hasMatch(_email)) {
      error = 'Invalid email format';
    }

    setState(() {
      _emailError = error;
    });
  }

  void _validatePassword() {
    String error = '';

    if (_password.isEmpty) {
      error = 'Password is required';
    } else if (_password.length < _passwordMinLength) {
      error = 'Password must be at least 8 characters';
    } else if (_password.length > _passwordMaxLength) {
      error = 'Password must be less than 64 characters';
    } else if (!_password.contains(_emailUpperCase)) {
      error = 'Password must contain an uppercase letter';
    } else if (!_password.contains(_emailNumber)) {
      error = 'Password must contain a number';
    }

    setState(() {
      _passwordError = error;
    });
  }

  void _showSuccessfulDialog() {
    showDialog(context: context, builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check, color: Colors.green, size: 50),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Login Successful', style: TextStyle(fontSize: 20)),
              ),
              SubmitButtonWidget(
                text: 'Close',
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      );
    });
  }

  void _handleSubmit() {
    _validateEmail();
    _validatePassword();

    if (!_isTouched) {
      setState(() {
        _isTouched = true;
      });
    }

    if (_emailError.isEmpty && _passwordError.isEmpty) {
      _showSuccessfulDialog();
    }
  }

  void _handleEmailChanged(String value) {
    _email = value;

    if (_isTouched) {
      _validateEmail();
    }
  }

  void _handlePasswordChanged(String value) {
    _password = value;

    if (_isTouched) {
      _validatePassword();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
          children: [
            FormFieldWidget(
                autofocus: true,
                label: 'Email',
                error: _emailError,
                onChanged: _handleEmailChanged,
                isTouched: _isTouched
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FormPasswordFieldWidget(
                  label: 'Password',
                  error: _passwordError,
                  onChanged: _handlePasswordChanged,
                  isTouched: _isTouched
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SubmitButtonWidget(
                  text: 'Sign up',
                  onPressed: _handleSubmit,
                )
            )
          ]
      )
    );
  }
}