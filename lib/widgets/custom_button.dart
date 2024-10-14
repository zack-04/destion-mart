import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.bgColor,
    required this.fontColor,
    required this.text,
    this.side,
    required this.onPressed,
  });
  final WidgetStateProperty<Color?>? bgColor;
  final Color fontColor;
  final String text;
  final WidgetStateProperty<BorderSide?>? side;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: bgColor,
          // foregroundColor: WidgetStateProperty.all<Color>(
          //   const Color.fromARGB(255, 15, 86, 18),
          // ), // Font color
          side: side,
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(fontSize: 15, color: fontColor),
        ),
      ),
    );
  }
}
