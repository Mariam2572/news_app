import 'package:flutter/material.dart';

class MyTheme {
  static const Color primaryColor = Color(0xff39A552);
  static const Color whiteColor = Color(0xfffffffff);
  static const Color greyColor = Color(0xff79828B);
  static const Color blueColor = Color(0xff003E90);
  static const Color blueLightColor = Color(0xff4882CF);
  static const Color redColor = Color(0xffC91C22);
  static const Color brawnColor = Color(0xffCF7E48);
  static const Color pinkColor = Color(0xffED1E79);
  static const Color yellowColor = Color(0xffF2D352);
  static const Color blackColor = Color(0xff42505C);

  static ThemeData lightMode = ThemeData(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: whiteColor, fontSize: 22, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            color: blackColor, fontSize: 18, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(
            color: greyColor, fontSize: 15, fontWeight: FontWeight.bold),
      ));
}
