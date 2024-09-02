import 'package:flutter/material.dart';
import 'submit_button.dart';
import 'form_field_widget.dart';
import 'form_password_field_widget.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  State<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends State<SignupFormWidget> {
  String _email = '';
  String _password = '';

  String _emailError = '';
  List<PasswordError> _passwordErrors = [PasswordError.minLength, PasswordError.uppercase, PasswordError.number];
  bool _isEmailTouched = false;
  bool _isPasswordTouched = false;

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

    if (error != _emailError) {
      setState(() {
        _emailError = error;
      });
    }
  }

  void _validatePassword() {
    List<PasswordError> errors = [];

    if (_password.isEmpty) {
      errors.add(PasswordError.required);
    }

    if (_password.length < _passwordMinLength || _password.contains(' ')) {
      errors.add(PasswordError.minLength);
    }

    if (_password.length > _passwordMaxLength) {
      errors.add(PasswordError.maxLength);
    }

    if (!_password.contains(_emailUpperCase)) {
      errors.add(PasswordError.uppercase);
    }

    if (!_password.contains(_emailNumber)) {
      errors.add(PasswordError.number);
    }

    setState(() {
      _passwordErrors = errors;
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

    if (!_isEmailTouched || !_isPasswordTouched) {
      setState(() {
        _isEmailTouched = true;
        _isPasswordTouched = true;
      });
    }

    if (_emailError.isEmpty && _passwordErrors.isEmpty) {
      _showSuccessfulDialog();
    }
  }

  void _handleEmailChanged(String value) {
    _email = value;

    if (_isEmailTouched) {
      _validateEmail();
    }
  }

  void _handleEmailFieldBlur() {
    if (!_isEmailTouched) {
      setState(() {
        _isEmailTouched = true;
      });
    }

    _validateEmail();
  }

  void _handlePasswordFieldBlur() {
    if (!_isPasswordTouched) {
      setState(() {
        _isPasswordTouched = true;
      });
    }

    _validatePassword();
  }

  void _handlePasswordChanged(String value) {
    _password = value;

    _validatePassword();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
          children: [
            FormFieldWidget(
                label: 'Email',
                error: _emailError.isNotEmpty,
                errorMessage: _emailError,
                onChanged: _handleEmailChanged,
                onBlur: _handleEmailFieldBlur,
                isTouched: _isEmailTouched
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: FormPasswordFieldWidget(
                  label: 'Password',
                  errors: _passwordErrors,
                  onChanged: _handlePasswordChanged,
                  onBlur: _handlePasswordFieldBlur,
                  isTouched: _isPasswordTouched
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