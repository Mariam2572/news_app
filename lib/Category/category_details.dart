// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:news_app/API/api_manager.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/mytheme.dart';
import 'package:news_app/tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category';
CategoryDM categoryDM;
   CategoryDetails({
    
    required this.categoryDM,
  });
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<SourceResponse?>(
            future: ApiManager.getSources(widget.categoryDM.id),
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
                          ApiManager.getSources(widget.categoryDM.id);
                          setState(() {});
                        },
                        child: const Text('Try again'))
                  ],
                );
              }
              if (snapshot.data?.status != 'ok') {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? 'Something went wrong'),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getSources(widget.categoryDM.id);
                        },
                        child: const Text('Try again'))
                  ],
                );
              } // Success
              var sourceList = snapshot.data?.sources ?? [];
              return TabWidget(sourcesList: sourceList);
            },
          );
        
     
  }
}
