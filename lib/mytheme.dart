import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color whiteColor = Color(0xfffffffff);

  static ThemeData lightMode = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: primaryColor ,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.bold
      )
    )
  );
}
