import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMovieDetailUseCase {
  final MovieRepository repository;

  GetMovieDetailUseCase(this.repository);

  Future<Movie> call(int movieId) {
    return repository.getMovieDetail(movieId);
  }
}
