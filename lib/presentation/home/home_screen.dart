import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/movie_list_item.dart';
import 'home_view_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      final query = _searchController.text;
      ref.read(homeViewModelProvider.notifier).searchMovies(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fenix Movies'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            16.verticalSpace,
            Expanded(
              child: Builder(
                builder: (context) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }

                  if (state.movies.isEmpty) {
                    return const Center(child: Text('No movies found.'));
                  }

                  return ListView.separated(
                    itemCount: state.movies.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return MovieListItem(movie: movie);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
