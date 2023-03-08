import 'package:flutter/material.dart';

// Color primary = const Color(0xff687daf);

double mainMargin = 18;
double subMargin = 14;

double buttonRadius = 8;
double mainMarginHalf = 9;

const Color primary = Color(0xFF2C3137);
const Color secondary = Color(0xFF2C3137);
const Color black = Color(0xFF000000);
const Color white = Color(0xFFFFFFFF);
const Color grey = Color(0xFFF6F6F6);
const Color red = Color(0xFFec5766);
const Color green = Color(0xFF43aa8b);
const Color blue = Color(0xFF28c2ff);
const Color errorColor = red;

const Color succses = green;

class Styles {
  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3B3B3B);
  static Color bgColor = const Color(0xffeeedf2);
  static Color orangeColor = const Color(0xff526799);

  static TextStyle textStyle = TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500);
  static TextStyle headlineStyle1 = TextStyle(fontSize: 26, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headlineStyle2 = TextStyle(fontSize: 21, color: textColor, fontWeight: FontWeight.bold);
  static TextStyle headlineStyle3 = TextStyle(fontSize: 17, color: Colors.grey.shade500, fontWeight: FontWeight.bold);
  static TextStyle headlineStyle4 = TextStyle(fontSize: 14, color: Colors.grey.shade500, fontWeight: FontWeight.bold);
}
