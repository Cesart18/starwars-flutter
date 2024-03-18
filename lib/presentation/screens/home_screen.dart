import 'package:animate_do/animate_do.dart';
import 'package:enciclopedia_starwars/presentation/providers/char_providers.dart';
import 'package:enciclopedia_starwars/presentation/screens/widgets/widgets.dart';
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
    final chars = ref.watch(getCharsByPage);
    return CustomScrollView(
      controller: scrollControler,
      slivers: [
        SliverAppBar(
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
                  preferredSize: const Size(double.infinity, 50),
                  child: FadeIn(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                    ),
                  ))
              : null,
          backgroundColor: Colors.black45,
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
          itemCount: chars.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 4),
          itemBuilder: (context, index) {
            final char = chars[index];
            return ChardCard(char: char);
          },
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 30,
          ),
        )
      ],
    );
  }
}
