import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String label;
  final String error;
  final void Function(String) onChanged;

  const FormFieldWidget({super.key, required this.label, required this.error, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(microseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: onChanged,
              decoration: InputDecoration(labelText: label),
            ),
            if (error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                // align left
                child: Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
              )
          ],
        ),
      ),
    );
  }
}