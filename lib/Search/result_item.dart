// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/mytheme.dart';

class ResultItem extends StatelessWidget {
    NewsResponse newsResponse;

  ResultItem({
    Key? key,
    required this.newsResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    ListView.separated(
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
             ;
  }
}
