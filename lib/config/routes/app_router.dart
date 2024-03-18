


  import 'package:enciclopedia_starwars/domain/domain.dart';
import 'package:enciclopedia_starwars/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen()
      ),
    GoRoute(
      path: '/character/:name',
      builder: (context, state){
        final Character char = state.extra as Character;
        return CharacterScreen(char: char);
      }
      ),

]);