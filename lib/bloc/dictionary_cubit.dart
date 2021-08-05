import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutterdictionary/model/word_response.dart';
import 'package:flutterdictionary/repository/word_repository.dart';
import 'package:meta/meta.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  DictionaryCubit(this._repository) : super(DictionaryInitial());
  final queryController = TextEditingController();

  Future getWordSearch() async {
    emit(SearchingState());
    try {
      final words = await _repository.getWordsFromAPI(queryController.text);
      print(words.toString());
      emit(SearchedState(words));
      emit(DictionaryInitial());
    } on Exception catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }
}
