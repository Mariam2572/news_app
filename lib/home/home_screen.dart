import 'package:flutter/material.dart';
import 'package:news_app/mytheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class HomeScreen extends StatelessWidget {
  static const String routName = 'Home screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // child : image
        Container(color: MyTheme.whiteColor,),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)?.app_title??""),
          ),
        )
      ],
    );
  }
}
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
*/