import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield2 extends StatelessWidget {
  const CustomTextfield2({
    super.key,
    this.inputFormatters,
    required this.controller,
    this.focusNode,
    this.maxLines,
    required this.text,
    this.obscureText,
    this.validator,
    this.inputFormatter,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.onChanged,
    this.errorBorder,
  });
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final int? maxLines;
  final String text;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final InputBorder? errorBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      cursorColor: Colors.grey,
      onChanged: onChanged,

      onTapOutside: (value) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.grey.shade700,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorBorder: errorBorder,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
      ),
    );
  }
}
