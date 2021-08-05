import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdictionary/bloc/dictionary_cubit.dart';

dictionaryFormWidget(BuildContext context){
  final cubit = context.watch<DictionaryCubit>();
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Spacer(),
        Text(
          "Dictionary App",
          style: TextStyle(
            color: Colors.deepOrangeAccent,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Search any word you want quickly",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        TextField(
          controller: cubit.queryController,
          decoration: InputDecoration(
            hintText: "Search a word",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            fillColor: Colors.grey[100],
            filled: true,
            prefixIcon: Icon(Icons.search),
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        Spacer(),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              cubit.getWordSearch();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.deepOrangeAccent,
                padding: const EdgeInsets.all(16)),
            child: Text("SEARCH"),
          ),
        ),
      ],
    ),
  );
}

loadingWidget(){
  return Center(child: CircularProgressIndicator(),);
}

errorWidget(String message){
  return Center(child: Text(message),);
}