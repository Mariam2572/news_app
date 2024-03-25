// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_app/model/source_response.dart';

abstract class SourceState {}
class SourceInitialState extends SourceState{}
class SourceLoadingState extends SourceState{
  //TODO: loading message
}
class SourceErrorState extends SourceState {
  String ? errorMessage;
  SourceErrorState({
    this.errorMessage,
  });
}

class SourceSuccessState extends SourceState {
  List<Source> sourcesList ;
  SourceSuccessState({
    required this.sourcesList,
  });
  
}
