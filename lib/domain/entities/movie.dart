import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  final String? posterPath;

  @HiveField(4)
  final double voteAverage;

  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.voteAverage});
}
