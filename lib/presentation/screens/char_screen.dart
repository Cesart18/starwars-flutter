import 'package:enciclopedia_starwars/domain/domain.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  final Character char;
  const CharacterScreen({super.key, required this.char});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(char.name,
            style: textStyle.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
            Text('Genero: ${char.gender}',
            style: textStyle.bodyLarge,),
            Text('Masa: ${char.mass}',
            style: textStyle.bodyLarge,),
            Text('Skin Color: ${char.skinColor}',
            style: textStyle.bodyLarge,),
            Text('Hair Color: ${char.hairColor}',
            style: textStyle.bodyLarge,),
            Text('Altura: ${char.height}',
            style: textStyle.bodyLarge,),
          ],
        ),
      ),
    );
  }
}