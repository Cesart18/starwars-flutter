



import 'package:enciclopedia_starwars/domain/domain.dart';
import 'package:enciclopedia_starwars/infrastructure/infrastructure.dart';

class CharRepositoryImpl implements CharRepository{

  final CharDatasource datasource;

  CharRepositoryImpl({CharDatasource? datasource}):datasource = datasource ?? CharDatasourceImpl();

  @override
  Future<List<Character>> getChars({int page = 1}) {
    return datasource.getChars(page: page);
  }

}