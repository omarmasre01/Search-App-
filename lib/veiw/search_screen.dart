import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:searching_with_bloc/manager/search_block.dart';
import 'package:searching_with_bloc/manager/search_events.dart';
import 'package:searching_with_bloc/manager/search_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Search App"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                onChanged: (value) {
                  context.read<SearchBlock>().add(SearchWord(word: value));
                },
              ),
            ),
            BlocBuilder<SearchBlock, SearchStates>(
              builder: (context, state) {
                if (state is LoadedWords) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.words.length,
                        itemBuilder: (context, value) {
                          return ListTile(
                            leading: Text("${state.words[value]}"),
                          );
                        }),
                  );
                } else
                  return CircularProgressIndicator();
              },
            ),
          ],
        ));
  }
}
