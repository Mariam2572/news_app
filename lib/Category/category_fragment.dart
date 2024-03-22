// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:news_app/Category/category_item.dart';
import 'package:news_app/model/category_dm.dart';

class CategoryFragment extends StatelessWidget {
  static const String routeName = 'Category Fragment';
  var categoryList = CategoryDM.getCategories();
  Function onCategoryClick;
   CategoryFragment({
   
    required this.onCategoryClick,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppLocalizations.of(context)!.category_options}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categoryList[index]);
                  },
                  child: CategoryItem(
                      categoryDM: categoryList[index],
                      index: index),
                ); //List contains object of category
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
