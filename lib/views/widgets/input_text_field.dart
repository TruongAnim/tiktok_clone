import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;

  final String label;

  final IconData icon;

  final bool isObsecure;

  const InputTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.isObsecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor),
        ),
      ),
      obscureText: isObsecure,
    );
  }
}
