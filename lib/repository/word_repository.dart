import 'dart:convert';
import 'dart:io';
import 'package:flutterdictionary/model/word_response.dart';
import 'package:flutterdictionary/service/http_service.dart';

class WordRepository{
  Future<List<WordResponse>> getWordsFromAPI(String query) async {
    final response = await HttpService.getRequest("en_US/$query");
    try {
      if(response.statusCode == 200){
        final result = wordResponseFromJson(response.body);
        return result;
      } else {
        return [];
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}