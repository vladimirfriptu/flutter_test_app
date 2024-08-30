import 'package:flutter/material.dart';
import 'form_field_widget.dart';

enum PasswordError {
  required,
  minLength,
  maxLength,
  uppercase,
  number
}

enum PasswordRuleStatus {
  initial,
  success,
  error
}

class FormPasswordFieldWidget extends StatefulWidget {
  final String label;
  final List<PasswordError> errors;
  final void Function(String) onChanged;
  final bool isTouched;
  final bool autofocus;
  final void Function()? onBlur;

  const FormPasswordFieldWidget({
    super.key,
    required this.label,
    this.errors = const [],
    required this.onChanged,
    this.autofocus = false,
    this.onBlur,
    this.isTouched = false
  });

  @override
  State<FormPasswordFieldWidget> createState() => _FormPasswordFieldWidgetState();
}

class _FormPasswordFieldWidgetState extends State<FormPasswordFieldWidget> {
  bool _showPassword = false;

  void toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Color _buildRuleMessageColor(PasswordRuleStatus status) {
    switch (status) {
      case PasswordRuleStatus.error:
        return const Color(0xFFFF8080);
      case PasswordRuleStatus.success:
        return const Color(0xFF27B274);
      default:
        return const Color(0xFF6F91BC);
    }
  }

  Widget _buildRuleWidget(String message, PasswordRuleStatus status) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          message,
          style: TextStyle(
            color: _buildRuleMessageColor(status),
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }
  
  PasswordRuleStatus _buildRuleWidgetStatus(PasswordError rule) {
    if (widget.errors.contains(rule)) {
      if (widget.isTouched) {
        return PasswordRuleStatus.error;
      }

      return PasswordRuleStatus.initial;
    }

    return PasswordRuleStatus.success;
  }

  String _buildFieldErrorMessage() {
    if (!widget.isTouched) {
      return '';
    }

    if (widget.errors.contains(PasswordError.required)) {
      return 'Password is required';
    }

    if (widget.errors.contains(PasswordError.maxLength)) {
      return 'Password is too long';
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormFieldWidget(
            label: widget.label,
            error: widget.isTouched && widget.errors.isNotEmpty,
            onChanged: widget.onChanged,
            errorMessage: _buildFieldErrorMessage(),
            isTouched: widget.isTouched,
            autofocus: widget.autofocus,
            onBlur: widget.onBlur,
            suffixIcon: IconButton(
              iconSize: 24.0,
              onPressed: toggleShowPassword,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: const Color(0xFF6F91BC),
              padding: const EdgeInsets.only(right: 20.0),
              icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
            ),
            obscureText: !_showPassword
        ),
        _buildRuleWidget('8 characters or more (no spaces)', _buildRuleWidgetStatus(PasswordError.minLength)),
        _buildRuleWidget('Uppercase and lowercase letters', _buildRuleWidgetStatus(PasswordError.uppercase)),
        _buildRuleWidget('At least one digit ', _buildRuleWidgetStatus(PasswordError.number)),
      ],
    );
  }
}