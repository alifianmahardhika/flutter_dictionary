part of 'dictionary_cubit.dart';

@immutable
abstract class DictionaryState {}

class DictionaryInitial extends DictionaryState {}
class SearchingState extends DictionaryState {}
class SearchedState extends DictionaryState{
  final List<WordResponse> words;
  SearchedState(this.words);
}
class ErrorState extends DictionaryState{
  final message;

  ErrorState(this.message);
}
