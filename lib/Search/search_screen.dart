import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_app/API/api_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/mytheme.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  ApiManager manager =ApiManager();
  NewsResponse? newsResponse;
  void search(String q) {
    ApiManager.getSearch(q).then((results) {
      setState(() {
        newsResponse = results;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children:[
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .025,
                      left: MediaQuery.of(context).size.width * .035,
                      right: MediaQuery.of(context).size.width * .035),
                  child: CupertinoSearchTextField(
                    placeholderStyle: TextStyle(color: MyTheme.whiteColor),
                    padding: const EdgeInsets.all(12),
                    style: TextStyle(
                      color: MyTheme.whiteColor
                    ),
                    suffixIcon:
                        const Icon(Icons.cancel, color: MyTheme.whiteColor),
                    prefixIcon:  IconButton(onPressed: (){
                      Navigator.pop(context);
                    },
                     icon: Icon(Icons.arrow_back,
                     color: MyTheme.whiteColor,
                     )),
                    decoration: BoxDecoration(
                      
                        color: MyTheme.primaryColor,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: MyTheme.whiteColor, width: 1)),
                    controller: searchController,
                    onChanged: (value) {
                      if (value.isEmpty) {
                      } else {
                        search(searchController.text);
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                newsResponse == null
                    ? const SizedBox.shrink()
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: MyTheme.primaryColor,
                            thickness: 3,
                            height: 10,
                            endIndent: 10,
                            indent: 10,
                          );
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: newsResponse!.articles!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),

                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${newsResponse!.articles?[index].urlToImage}",
                                    height: MediaQuery.of(context).size.height *
                                        .20,
                                    width:
                                        MediaQuery.of(context).size.width * .45,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor: MyTheme.whiteColor,
                                        color: MyTheme.primaryColor,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.error,
                                      size: 50,
                                      color: MyTheme.primaryColor,
                                    ),
                                  ),
                                ),
                               
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsResponse!.articles![index].title ??
                                            '',
                                        maxLines: 5,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: MyTheme.blackColor

                                            )
                                            ,
                                      ),
                                       SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                        Text(
                                        newsResponse!.articles![index].description ??
                                            '',
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!.copyWith(
                                              fontSize: 10
                                            )
                                            ,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .05,
                                      ),
                                      Text(
                                          newsResponse!
                                              .articles![index].publishedAt!.substring(0, 10),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 10,
                                                  color: MyTheme.blackColor,
                                                  fontWeight: FontWeight.w400))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      )
              ],
            ),
          ),
        ),
     ] ),
    );
  }
}
//                                        
