// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/model/source_response.dart';
import 'package:news_app/mytheme.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;
  TabItem({
    required this.isSelected,
    required this.source,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: isSelected ? MyTheme.primaryColor : MyTheme.whiteColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(width: 3, color: MyTheme.primaryColor),
      ),
      child: Text(
        source.name ?? '',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isSelected ? MyTheme.whiteColor : MyTheme.primaryColor),
      ),
    );
  }
}
