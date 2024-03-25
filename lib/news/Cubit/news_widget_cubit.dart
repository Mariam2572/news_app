import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/API/api_manager.dart';
import 'package:news_app/news/Cubit/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsLoadingStates());
   int selectedIndex =0;
    void changeIndex(int newIndex){
      selectedIndex = newIndex;
    }
  Future<void> getNewsByCategoryId(String sourceId) async {
   
    try {
      emit(NewsLoadingStates());
      var response = await ApiManager.getNewsBySource(sourceId);
      if (response!.status == 'error') {
        emit(NewsErrorStates(errorMessage: response.message!));
        return;
      } else if (response.status == 'ok') {
        emit(NewsSuccessStates(newsList: response.articles!));
      }
    } on Exception catch (e) {
      emit(NewsErrorStates(errorMessage: e.toString()));
    }
  }
}
