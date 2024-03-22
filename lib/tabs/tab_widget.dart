// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/news/news_widget.dart';
import 'package:news_app/tabs/tab_item.dart';

class TabWidget extends StatefulWidget {
  List<Source> sourcesList;
  TabWidget({
    Key? key,
    required this.sourcesList,
  }) : super(key: key);
  @override
  State<TabWidget> createState() => _TabWidgetState();
}
class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList
                    .map((source) => TabItem(
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(source),
                        source: source))
                    .toList()),
            Expanded(
                child: NewsWidget(source: widget.sourcesList[selectedIndex],))
          ],
        ));
  }
}
