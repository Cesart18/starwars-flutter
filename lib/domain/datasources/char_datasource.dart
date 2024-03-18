


  import 'package:enciclopedia_starwars/domain/domain.dart';

abstract class CharDatasource {

    Future<List<Character>> getChars({ int page = 1 });

  }