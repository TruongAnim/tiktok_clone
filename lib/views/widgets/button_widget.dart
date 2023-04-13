import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: buttonColor,
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
