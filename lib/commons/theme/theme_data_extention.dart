import 'package:flutter/material.dart';
extension ThemeDataExtention on ThemeData {
  TextStyle get bodySmall1 {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFF989898),
    );
  }
  TextStyle get bodySmall2 {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Color(0xFF989898),
    );
  }
}
