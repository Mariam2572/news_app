import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
   double get height => MediaQuery.of(this).size.height;
   double get width => MediaQuery.of(this).size.width;
}extension NavigatorHelper on BuildContext {
  
}