import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/API/api_manager.dart';
import 'package:news_app/Category/Cubit/states.dart';

class CategoryDetailsViewModel extends Cubit<SourceState> {
  CategoryDetailsViewModel():super(SourceInitialState());
Future<void> getSources(String categoryId) async {
 try {
  emit(SourceLoadingState());
  var response= await ApiManager.getSources(categoryId);

if (response!.status == 'error') {
  emit(SourceErrorState(errorMessage: response.message));
  return;
}
if (response.status== 'ok') {
  emit(SourceSuccessState(sourcesList: response.sources!));
  return;
}
} on Exception catch (e) {
  // TODO
  emit(SourceErrorState(errorMessage: e.toString()));
}
}

}