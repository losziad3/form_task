import 'package:flutter/material.dart';

class TitleOfTextFormField extends StatelessWidget {
  const TitleOfTextFormField({
    super.key,
    required this.textScaleFactor, required this.text,
  });

  final double textScaleFactor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18 * textScaleFactor,
        ),
      ),
    );
  }
}