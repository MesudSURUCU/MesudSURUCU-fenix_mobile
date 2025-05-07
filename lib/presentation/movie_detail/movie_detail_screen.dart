import 'package:fenix_mobile/core/constants/api_constants.dart';
import 'package:fenix_mobile/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/movie.dart';
import 'favorite_movies_notifier.dart';

class MovieDetailScreen extends ConsumerWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoriteMoviesProvider);
    final isFavorite =
        ref.read(favoriteMoviesProvider.notifier).isFavorite(movie);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? ColorConstants.red : null,
            ),
            onPressed: () {
              ref.read(favoriteMoviesProvider.notifier).toggleFavorite(movie);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            if (movie.posterPath != null)
              Hero(
                tag: movie.id,
                child: Image.network(
                  '${ApiConstants.imageBaseUrl}${movie.posterPath}',
                ),
              ),
            16.verticalSpace,
            Row(children: [
              Expanded(
                child: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              50.horizontalSpace,
              Padding(
                padding: EdgeInsets.only(right: 16.r),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: ColorConstants.amber),
                    Text(
                      movie.voteAverage.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ]),
            16.verticalSpace,
            Text(
              movie.overview,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
