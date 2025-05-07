import '../../domain/entities/movie.dart';

class HomeState {
  final bool isLoading;
  final List<Movie> movies;
  final String? error;

  const HomeState({
    required this.isLoading,
    required this.movies,
    this.error,
  });

  factory HomeState.initial() {
    return const HomeState(isLoading: false, movies: [], error: null);
  }

  HomeState copyWith({
    bool? isLoading,
    List<Movie>? movies,
    String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      movies: movies ?? this.movies,
      error: error,
    );
  }
}
