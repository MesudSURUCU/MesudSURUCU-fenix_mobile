import 'package:fenix_mobile/core/network/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final apiService = ref.watch(apiClientProvider);
  return MovieRepositoryImpl(apiService);
});

class MovieRepositoryImpl implements MovieRepository {
  final ApiService _apiService;

  MovieRepositoryImpl(this._apiService);

  @override
  Future<List<Movie>> getTrendingMovies() async {
    final response = await _apiService.getTopRatedMovies();
    return response.results;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final response = await _apiService.searchMovies(query);
    return response.results;
  }

  @override
  Future<Movie> getMovieDetail(int movieId) async {
    final response = await _apiService.getMovieDetail(movieId);
    return response;
  }
}
