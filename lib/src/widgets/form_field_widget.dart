import 'package:flutter/material.dart';

class AbstractColors {
  static Color success = const Color(0xFF27B274);
  static Color error = const Color(0xFFFF8080);
  static Color primary = const Color(0xFF4A4E71);
  static Color inactive = const Color(0xFF6F91BC);
}

class FormFieldWidget extends StatefulWidget {
  final String label;
  final bool error;
  final String errorMessage;
  final void Function(String) onChanged;
  final bool isTouched;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool autofocus;
  final void Function()? onBlur;

  const FormFieldWidget({
    super.key,
    required this.label,
    this.error = false,
    required this.onChanged,
    this.errorMessage = '',
    this.isTouched = false,
    this.suffixIcon,
    this.onBlur,
    this.autofocus = false,
    this.obscureText = false
  });

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
   bool _isFocused = false;
   String _value = '';

   final OutlineInputBorder _errorBorder = OutlineInputBorder(
       borderRadius: const BorderRadius.all(Radius.circular(10)),
       borderSide: BorderSide(
           color: AbstractColors.error,
       )
   );

   Color _getTextFieldColor() {
     final bool isSuccessful = widget.isTouched && !widget.error;

     if (isSuccessful) {
       return AbstractColors.success;
     }

     if (widget.error) {
       return AbstractColors.error;
     }

     if (_isFocused || _value.isNotEmpty) {
       return AbstractColors.primary;
     }

     return AbstractColors.inactive;
   }

   Color _getHintFieldColor() {
     if (widget.error) {
        return AbstractColors.error;
      }

      if (_isFocused) {
        return AbstractColors.primary;
      }

      return AbstractColors.inactive;
   }

   void _handleTextChanged(String value) {
     widget.onChanged(value);

     setState(() {
       _value = value;
     });
   }

   void _handleFocusChange(bool hasFocus) {
     setState(() {
       _isFocused = hasFocus;
     });

     if (!hasFocus) {
       widget.onBlur?.call();
     }
   }

   Widget? _buildErrorWidget() {
      if (widget.error) {

        if (widget.errorMessage.isNotEmpty) {
          return Text(
              widget.errorMessage,
              style: TextStyle(
                  color: AbstractColors.error,
                  fontSize: 13.0
              )
          );
        }

        return Container();
      }

      return null;
   }

  @override
  Widget build(BuildContext context) {
    final bool isSuccessful = widget.isTouched && !widget.error;

    return Padding(
      padding: EdgeInsets.only(bottom: widget.errorMessage.isEmpty ? 24.0 : 0.0),
      child: Focus(
          onFocusChange: _handleFocusChange,
          child: Container(
            child: TextField(
              onChanged: _handleTextChanged,
              style: TextStyle(
                color: _getTextFieldColor(),
              ),
              obscureText: widget.obscureText,
              autofocus: widget.autofocus,
              decoration: InputDecoration(
                hintText: widget.label,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.5),
                hintStyle: TextStyle(
                    color: _getHintFieldColor(),
                    fontSize: 16.0
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: isSuccessful ? AbstractColors.success : Colors.transparent,
                    )
                ),
                suffixIcon: widget.suffixIcon,
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: isSuccessful ? AbstractColors.success : AbstractColors.inactive,
                  ),
                ),
                errorBorder: _errorBorder,
                focusedErrorBorder: _errorBorder,
                error: _buildErrorWidget(),
              ),
            )
          )
      )
    );
  }
}