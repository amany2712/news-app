import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF39A552);
  static const Color navy = Color(0xFF4F5A69);
  static const Color black = Color(0xFF303030);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFC91C22);



  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      foregroundColor: white,
      elevation: 0,
      backgroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(34) 
        )
    ),
    textTheme: TextTheme(
      titleLarge:  TextStyle(
        fontSize: 22,
        color: white,
        fontWeight: FontWeight.bold,
      )
    )

  );










static ThemeData darkTheme = ThemeData();

}