





  import 'package:enciclopedia_starwars/domain/domain.dart';

abstract class CharRepository {

    Future<List<Character>> getChars({ int page = 1});

  }