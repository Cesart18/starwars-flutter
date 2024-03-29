import 'package:animate_do/animate_do.dart';
import 'package:enciclopedia_starwars/presentation/providers/char_providers.dart';
import 'package:enciclopedia_starwars/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  __HomeViewState createState() => __HomeViewState();
}

bool show = false;

final scrollControler = ScrollController();

class __HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    scrollControler.addListener(() {
      if( scrollControler.position.pixels + 100 >= scrollControler.position.maxScrollExtent ){
        ref.read(getCharsByPage.notifier).loadNextPage();
      }
     });
  }

  @override
  void dispose() {
    scrollControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gender = ref.watch(genderProvider);
    final  chars = ref.watch(getCharsByPage);
    final filteredChars = ref.watch(getCharsByPage.notifier).getFilteredChars(gender, chars);
    return CustomScrollView(
      controller: scrollControler,
      slivers: [
        SliverAppBar(
          floating: true,
          centerTitle: false,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enciclopedia '),
              Text(
                'Starwars',
                style: TextStyle(color: Colors.yellow),
              )
            ],
          ),
          bottom: show
              ? PreferredSize(
                  preferredSize: const Size(double.infinity, 70),
                  child: FadeIn(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20,),
                      child: const FilterButton(),
                    ),
                  ))
              : null,
          backgroundColor: Colors.grey,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
                icon: const Icon(Icons.filter_alt)),
          ],
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverGrid.builder(
          itemCount: filteredChars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 4),
          itemBuilder: (context, index) {
            final char = filteredChars[index];
            return ChardCard(char: char);
          },
        ),
         SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
            child: ( filteredChars.length <=  7 )?
            IconButton(onPressed: (){
              ref.read(getCharsByPage.notifier).loadNextPage();
            }, icon: const Icon(Icons.arrow_drop_down)): null,
          ),
        )
      ],
    );
  }
}
