import 'package:fenix_mobile/presentation/favorites/favorites_screen.dart';
import 'package:fenix_mobile/presentation/home/home_screen.dart';
import 'package:fenix_mobile/presentation/main/main_screen.dart';
import 'package:fenix_mobile/presentation/movie_detail/movie_detail_screen.dart';
import 'package:go_router/go_router.dart';

import '../domain/entities/movie.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'main',
      builder: (context, state) => const MainScreen(),
      routes: [
        GoRoute(
          path: 'home',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: 'favorites',
          name: 'favorites',
          builder: (context, state) => const FavoritesScreen(),
        ),
        GoRoute(
          path: 'detail',
          name: 'detail',
          builder: (context, state) {
            final movie = state.extra as Movie;
            return MovieDetailScreen(movie: movie);
          },
        ),
      ],
    ),
  ],
);
