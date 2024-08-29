import 'package:flutter/material.dart';
import 'form_field_widget.dart';

class FormPasswordFieldWidget extends StatefulWidget {
  final String label;
  final String error;
  final void Function(String) onChanged;
  final bool isTouched;
  final bool autofocus;

  const FormPasswordFieldWidget({
    super.key,
    required this.label,
    required this.error,
    required this.onChanged,
    this.autofocus = false,
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

  @override
  Widget build(BuildContext context) {
    return FormFieldWidget(
      label: widget.label,
      error: widget.error,
      onChanged: widget.onChanged,
      isTouched: widget.isTouched,
      autofocus: widget.autofocus,
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
    );
  }
}