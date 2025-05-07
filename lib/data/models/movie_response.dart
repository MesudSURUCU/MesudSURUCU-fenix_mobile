import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'results')
  final List<MovieModel> results;

  MovieResponse({required this.results});

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
