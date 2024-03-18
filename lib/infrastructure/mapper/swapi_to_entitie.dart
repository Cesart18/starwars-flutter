import 'package:enciclopedia_starwars/domain/entities/character.dart';
import 'package:enciclopedia_starwars/infrastructure/model/swapi_response.dart';

class CharMapper {
  static Character swapiToEntitie( CharSwapi char ) => Character(
      name: char.name,
      height: char.height,
      mass: char.mass,
      hairColor: char.hairColor,
      skinColor: char.skinColor,
      gender: char.gender);
}
