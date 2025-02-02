abstract class SearchStates {}

class InitialState extends SearchStates {}

class Loading extends SearchStates {}

class LoadedWords extends SearchStates {
  List<String> words;
  LoadedWords({
    required this.words,
  });
}
