import 'package:flutter/material.dart';

BottomNavigationBarItem navigationBarItem(
    {required String label, required String image}) {
  return BottomNavigationBarItem(
    icon: SizedBox(
        width: label.isEmpty ? 50 : 25,
        height: label.isEmpty ? 40 : 25,
        child: Image.asset(
          image,
        )),
    label: label,
  );
}
