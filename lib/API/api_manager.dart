import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/API/api_constants.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

/*
https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
4f5b4168bf90403aa5f3bd1368fd2fa3
*/
class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndPoint,
        {'apiKey': '4f5b4168bf90403aa5f3bd1368fd2fa3',
        'category':categoryId
        });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      /// String
      var json = jsonDecode(responseBody);
      ///String => json
      return SourceResponse.fromJson(json);
    } on Exception catch (e) {

throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySource(  String? sourceId  ) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint,
        {'apiKey': '4f5b4168bf90403aa5f3bd1368fd2fa3',
         'sources': sourceId,
         });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } on Exception catch (e) {
      throw e;
    }
  }
  static Future<NewsResponse?> getSearch(String q) async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/everything?q=${q}&apiKey=4f5b4168bf90403aa5f3bd1368fd2fa3');
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}


/// authority => base URL (اسم السرفر)
/// unencodedPath => باقي URL / اسم api اللي هعملها call
/// query parameters =>
