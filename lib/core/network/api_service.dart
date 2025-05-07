import 'package:fenix_mobile/data/models/movie_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../data/models/movie_model.dart';
import '../../core/constants/api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('movie/top_rated')
  Future<MovieResponse> getTopRatedMovies();

  @GET('search/movie')
  Future<MovieResponse> searchMovies(@Query('query') String query);

  @GET('movie/{movie_id}')
  Future<MovieModel> getMovieDetail(@Path('movie_id') int movieId);
}
