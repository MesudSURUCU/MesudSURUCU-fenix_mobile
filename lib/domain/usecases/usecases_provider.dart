import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/movie_repository_impl.dart';
import 'get_trending_movies_usecase.dart';
import 'get_movie_detail_usecase.dart';
import 'search_movies_usecase.dart';

final getTrendingMoviesProvider = Provider<GetTrendingMoviesUseCase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetTrendingMoviesUseCase(repository);
});

final searchMoviesProvider = Provider<SearchMoviesUseCase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return SearchMoviesUseCase(repository);
});

final getMovieDetailProvider = Provider<GetMovieDetailUseCase>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetMovieDetailUseCase(repository);
});
