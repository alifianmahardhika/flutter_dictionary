import 'package:flutter/material.dart';
import 'package:flutterdictionary/model/word_response.dart';
import 'package:flutterdictionary/ui/detail/detail_screen.dart';

class ListScreen extends StatelessWidget {
  final List<WordResponse>? words;

  ListScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(
                  words?[index].word ?? "Default String",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  words?[index].meanings?[0].partOfSpeech ?? "null",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(words?[index]),
                    ),
                  );
                },
              ),
          separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
              ),
          itemCount: words?.length ?? 0),
    );
  }
}
