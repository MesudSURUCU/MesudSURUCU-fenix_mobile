import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getTrendingMovies();
  Future<List<Movie>> searchMovies(String query);
  Future<Movie> getMovieDetail(int movieId);
}
