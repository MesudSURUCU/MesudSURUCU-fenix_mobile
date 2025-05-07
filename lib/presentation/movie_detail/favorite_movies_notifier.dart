import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/movie.dart';

class FavoriteMoviesNotifier extends StateNotifier<List<Movie>> {
  final Box<Movie> _favoritesBox;

  FavoriteMoviesNotifier(this._favoritesBox)
      : super(_favoritesBox.values.toList());

  void toggleFavorite(Movie movie) {
    if (isFavorite(movie)) {
      _favoritesBox.delete(movie.id);
    } else {
      _favoritesBox.put(movie.id, movie);
    }
    state = _favoritesBox.values.toList();
  }

  bool isFavorite(Movie movie) {
    return _favoritesBox.containsKey(movie.id);
  }
}

final favoriteMoviesProvider =
    StateNotifierProvider<FavoriteMoviesNotifier, List<Movie>>((ref) {
  final box = Hive.box<Movie>('favorites');
  return FavoriteMoviesNotifier(box);
});
