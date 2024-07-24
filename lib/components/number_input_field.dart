import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double borderRadius;
  final String? Function(String?)? validator;
  final int maxLength;


  NumberInputField({
    required this.controller,
    required this.labelText,
    this.borderRadius = 18.0,
    required this.validator, required this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        // autofocus: true,
        controller: controller,
        validator: validator,
        keyboardType: TextInputType.text,
        maxLength: maxLength,


        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
