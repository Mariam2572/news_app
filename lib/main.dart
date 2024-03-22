// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:news_app/Category/category_details.dart';
import 'package:news_app/Category/category_fragment.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/news/news_content.dart';
import 'package:news_app/providers/app_config_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppConfigProvider(),
        ),
      ],
      child: NewsApp(),
    ),
  );
}
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
      },
      theme: MyTheme.lightMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }
}
