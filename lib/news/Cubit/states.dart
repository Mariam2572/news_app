import '../../model/news_response.dart';
abstract class NewsStates{}
class NewsLoadingStates extends NewsStates {}
class NewsErrorStates extends NewsStates {
 String errorMessage;
  NewsErrorStates({
    required this.errorMessage,
  });
}
class NewsSuccessStates extends NewsStates {
  List<News> newsList;
  NewsSuccessStates({
    required this.newsList,
  });
}
class ChangeSource extends NewsStates {

}