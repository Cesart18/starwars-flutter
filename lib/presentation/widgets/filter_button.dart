import 'package:enciclopedia_starwars/domain/domain.dart';
import 'package:enciclopedia_starwars/presentation/providers/char_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final gender = ref.watch(genderProvider);
    return SegmentedButton(
      style: SegmentedButton.styleFrom(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(2)
        ),
        elevation: 13
      ),
      segments: const [
        ButtonSegment(
          label: Text('Todos'),
          value: Gender.all),
        ButtonSegment(
          label: Text('Hombres'),
          value: Gender.male),
        ButtonSegment(
          label: Text('Mujeres'),
          value: Gender.female),
      ],
       selected: {gender},
       onSelectionChanged: (newGender) {
         ref.read(genderProvider.notifier).state = newGender.first;
       },);
  }
}