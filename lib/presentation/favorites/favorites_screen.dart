import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/movie_list_item.dart';
import '../../domain/entities/movie.dart';
import '../movie_detail/favorite_movies_notifier.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Movie> favorites = ref.watch(favoriteMoviesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite movies yet.'))
          : ListView.separated(
              itemCount: favorites.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final movie = favorites[index];
                return MovieListItem(movie: movie);
              },
            ),
    );
  }
}
