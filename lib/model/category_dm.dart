import 'package:flutter/material.dart';
import 'package:news_app/mytheme.dart';

class CategoryDM {
  String id;
  String imagePath;
  Color color;
  String title;
  CategoryDM(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.color});
  /*
  business entertainment general health science sports technology
  */
  static List<CategoryDM> getCategories() {
    return [
      CategoryDM(
          id: 'sports',
          title: 'Sports',
          imagePath: 'assets/images/ball.png',
          color: MyTheme.redColor),
      CategoryDM(
          id: 'general',
          title: 'General',
          imagePath: 'assets/images/environment.png',
          color: MyTheme.blueColor),
      CategoryDM(
          id: 'health',
          title: 'Health',
          imagePath: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      CategoryDM(
          id: 'business',
          title: 'Business',
          imagePath: 'assets/images/bussines.png',
          color: MyTheme.brawnColor),
      CategoryDM(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: 'assets/images/environment.png',
          color: MyTheme.blueLightColor),
      CategoryDM(
          id: 'technology',
          title: 'Technology',
          imagePath: 'assets/images/science.png',
          color: MyTheme.yellowColor),
      CategoryDM(
          id: 'science',
          title: 'Science',
          imagePath: 'assets/images/science.png',
          color: MyTheme.primaryColor),
    ];
  }
}
