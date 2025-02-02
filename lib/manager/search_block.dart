import 'package:bloc/bloc.dart';
import 'package:searching_with_bloc/manager/search_events.dart';
import 'package:searching_with_bloc/manager/search_states.dart';

class SearchBlock extends Bloc<SearchEvents, SearchStates> {
  SearchBlock() : super(LoadedWords(words: words)) {
    on<SearchWord>((event, emit) {
      List<String> findWord = [];
      for (var element in words) {
        if (element.contains(event.word)) {
          findWord.add(element);
        }
      }
      emit(LoadedWords(words: findWord));
    });
  }

static  List<String> words = ['omar', 'masre', 'flutter', 'ui', 'bloc'];
}
