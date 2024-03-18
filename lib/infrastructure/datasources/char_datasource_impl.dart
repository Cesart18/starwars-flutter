



import 'package:dio/dio.dart';
import 'package:enciclopedia_starwars/domain/domain.dart';
import 'package:enciclopedia_starwars/infrastructure/mapper/swapi_to_entitie.dart';
import 'package:enciclopedia_starwars/infrastructure/model/swapi_response.dart';

class CharDatasourceImpl implements CharDatasource{

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://swapi.dev/api'
    )
  );


  List<Character> _toJson( Map<String,dynamic> json ){
    final swapiChar = SwapiResponse.fromJson(json);
    final List<Character> chars = swapiChar.results.map((char) => CharMapper.swapiToEntitie(char)).toList();
    return chars;
  }

  @override
  Future<List<Character>> getChars({int page = 1}) async{
    final response = await dio.get('/people/', queryParameters: {
      'page': page
    });
    return _toJson(response.data);
  }
}