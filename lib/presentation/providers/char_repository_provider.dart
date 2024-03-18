


import 'package:enciclopedia_starwars/domain/domain.dart';
import 'package:enciclopedia_starwars/infrastructure/datasources/char_datasource_impl.dart';
import 'package:enciclopedia_starwars/infrastructure/repositories/char_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final charRepositoryProvider = Provider<CharRepository>((ref) {
  return CharRepositoryImpl(datasource: CharDatasourceImpl());
});