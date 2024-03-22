// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:news_app/model/news_response.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/news/news_item.dart';
import 'package:url_launcher/url_launcher.dart' as _launchUrl;
import 'package:url_launcher/url_launcher.dart';

class ContentScreen extends StatelessWidget {
  static const String routName = 'Content Screen';

  NewsItem newsItem;
  News news;
  ContentScreen({
    Key? key,
    required this.newsItem,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: MyTheme.whiteColor,
        child: Image.asset(
          'assets/images/pattern.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
  Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
      title: Text("News Title"),
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          NewsItem(
            news: news,
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .45,
            decoration: BoxDecoration(
              color: MyTheme.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  news.content ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(news.url ?? ''));
                    },
                    child: Text(
                      'View Full Article',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.end,
                    ))
              ],
            ),
          ),
        ],
      ),
    ),
  )
]);
}
}
