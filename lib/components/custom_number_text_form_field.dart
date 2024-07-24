import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

Padding customNumberTextFormField(double screenWidth, double textScaleFactor, void Function(PhoneNumber)? onChanged) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
    ),
    child: IntlPhoneField(
      initialCountryCode: 'EG',
      showCountryFlag: false,
      showDropdownIcon: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(32),
        ),
        border: const OutlineInputBorder(),
        hintText: "Enter Phone Number",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14 * textScaleFactor,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01),
        // Set the prefix text to "+20^"
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Icon(Icons.access_alarms),
        ),
      ),
      onChanged: onChanged,
      // onChanged: (value) {
      //   // // Handle phone number input
      //   // phoneNumber =
      //   //     value.completeNumber; // Save the phone number input
      // },
      validator: (value) {
        // Validate phone number input
        if (value!.number == null || value.number.isEmpty) {
          return 'Phone number is required';
        }

        // Define a regular expression for Egyptian phone numbers
        final egyptPhoneNumberRegex = RegExp(r'^\+20\d{10}$');

        // Check if the phone number matches the Egyptian phone number pattern
        if (!egyptPhoneNumberRegex
            .hasMatch(value.completeNumber)) {
          return 'Please enter a valid Egyptian phone number starting with +20';
        }

        return null; // Phone number is valid
      },
    ),
  );
}