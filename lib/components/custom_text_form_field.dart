import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  // Constructor with parameters and default values
  CustomTextformfield({
    required this.controller,
    this.hinttext,
    this.onChanged,
    this.label,
    this.svgSuffixIconPath, // SVG asset path for suffix icon
    this.preIcons,
    this.obscuretext = false,
    this.validator,
    this.onSaved,
    this.maxLines = 1, // Default to single line
  });
  final TextEditingController controller;
  final String? hinttext;
  final String? label;
  final String? svgSuffixIconPath; // Path to the SVG file for suffix icon
  final IconData? preIcons;
  final bool obscuretext;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final int maxLines; // Number of lines for the text field

  @override
  Widget build(BuildContext context) {
    // Get the media query data
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    // Define default padding for the text form field
    final defaultPadding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.01, // Adjusted horizontal padding
    );

    return Padding(
      padding: defaultPadding,
      child: TextFormField(
        controller: controller,
        onSaved: onSaved,
        obscureText: obscuretext,
        validator: validator,
        onChanged: onChanged,
        maxLines: maxLines, // Allow multiple lines if specified
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: maxLines > 1 ? 20 : 12, // Adjust padding for larger fields
          ),
        ),
      ),
    );
  }
}
