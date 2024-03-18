


import 'package:enciclopedia_starwars/domain/domain.dart';
import 'package:enciclopedia_starwars/presentation/providers/char_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCharsByPage = StateNotifierProvider<CharNotifier, List<Character>>((ref) {
  final fetchMoreChars = ref.watch( charRepositoryProvider).getChars;
  return CharNotifier(fetchMoreChars: fetchMoreChars);
});



typedef CharCallBack = Future<List<Character>> Function({int page});

class CharNotifier extends StateNotifier<List<Character>> {

  bool isLoading = false;
  int currentPage = 0;
  CharCallBack fetchMoreChars;


  CharNotifier({ required this.fetchMoreChars }): super([]);


  Future<void> loadNextPage () async {
    if( isLoading ) return;

    isLoading = true;
    currentPage++;
    if( currentPage == 9 ) return;
    final List<Character> chars = await fetchMoreChars(page: currentPage);
    state = [...state, ...chars];
    await Future.delayed( const Duration(milliseconds: 300));
    isLoading = false;
  }
  
}