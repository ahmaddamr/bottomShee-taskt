import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.validator,
      this.onSaved,
      required this.obscureText,
      this.suffixIcon,
      this.filled,
      this.prefixIcon, this.controller, this.onChanged, this.onFieldSubmitted, this.maxLength, this.keyboardType, this.maxLines});
  final String hint;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final bool obscureText;
  final Widget? suffixIcon;
  final bool? filled;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      onSaved: onSaved,
      // obscureText: true,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        filled: filled,
        suffixIcon: suffixIcon,
        constraints: const BoxConstraints(minWidth: 410, minHeight: 48),
        errorMaxLines: 1,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Color(0xff5D5D5D),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(),
        ),
      ),
    );
  }
}
