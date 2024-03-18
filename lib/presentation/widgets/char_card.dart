import 'package:enciclopedia_starwars/domain/domain.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChardCard extends StatelessWidget {
  final Character char;
  const ChardCard({super.key, required this.char});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => context.push('/character/${char.name}',
      extra: char),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all()
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(char.name,
            style: textStyle.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
            Text('Genero: ${char.gender}'),
            Text('Masa: ${char.mass}'),
            Text('Color Skin: ${char.skinColor}'),
          ],
        ),
      ),
    );
  }
}