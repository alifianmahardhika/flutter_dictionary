import 'package:flutter/material.dart';
import 'package:flutterdictionary/bloc/dictionary_cubit.dart';
import 'package:flutterdictionary/ui/home/dictionary_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterdictionary/ui/list/list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return BlocListener(
      listener: (context, state) {
        if (state is SearchedState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListScreen(state.words),
            ),
          );
        }
      },
      bloc: cubit,
      child: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: cubit.state is SearchingState
            ? loadingWidget()
            : cubit.state is ErrorState
                ? errorWidget("Error loading API")
                : cubit.state is DictionaryInitial
                    ? dictionaryFormWidget(context)
                    : Container(),
      ),
    );
  }
}
