import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/mytheme.dart';

class NewsItem extends StatefulWidget {
  News news;
  NewsItem({
    required this.news,
  });
  @override
  State<NewsItem> createState() => _NewsItemState();
}
class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CachedNetworkImage(
              imageUrl: widget.news.urlToImage ?? '',
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(widget.news.author ?? '',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: 10,
          ),
          Text(widget.news.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black)),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.news.publishedAt?.substring(0, 10) ?? "",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
