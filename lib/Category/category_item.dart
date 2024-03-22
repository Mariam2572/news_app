// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/model/category_dm.dart';
import 'package:news_app/mytheme.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM categoryDM;
  int index;
  CategoryItem({
    required this.categoryDM,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryDM.color,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25),
              topRight: const Radius.circular(25),
              bottomLeft: Radius.circular(index % 2 == 0 ? 25 : 0),
              bottomRight: Radius.circular(index % 2 == 0 ? 0 : 25))),
      child: Column(
        children: [
          Image.asset(
            categoryDM.imagePath,
            height: MediaQuery.of(context).size.height / 6,
          ),
          Text(
            categoryDM.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.whiteColor),
          )
        ],
      ),
    );
  }
}
