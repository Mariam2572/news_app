// ignore_for_file: unused_import

import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/API/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/news/news_content.dart';
import 'package:news_app/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({
    required this.source,
  }) ;
  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}
class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySource(widget.source.id ?? '',),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              const Text('Something went wrong'),
               ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySource(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: const Text('Try again'))
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getNewsBySource(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: const Text('Try again'))
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(        
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).push
                  (CupertinoPageRoute(builder: 
                  (context) => ContentScreen(news: newsList[index], 
                        newsItem: NewsItem(                        
                      news: newsList[index],
                    )),
                  ));
                },
                child: NewsItem(news: newsList[index] ,
              //  articles: []
                ),
                );
          },
        );
      },
    );
  }
}
