import 'package:fenix_mobile/core/constants/api_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/movie.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: movie.posterPath != null
          ? Hero(
              tag: movie.id,
              child: Image.network(
                '${ApiConstants.imageBaseUrl}${movie.posterPath}',
                width: 50.w,
                fit: BoxFit.cover,
              ),
            )
          : const Icon(Icons.movie),
      title: Text(movie.title),
      subtitle:
          Text(movie.overview, maxLines: 2, overflow: TextOverflow.ellipsis),
      onTap: () {
        context.pushNamed("detail", extra: movie);
      },
    );
  }
}
