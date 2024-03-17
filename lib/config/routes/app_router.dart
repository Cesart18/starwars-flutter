


  import 'package:enciclopedia_starwars/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      builder: (context, state) => const HomeScreen(),
      path: '/')
]);