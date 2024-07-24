import 'package:flutter/material.dart';

AppBar mainAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}