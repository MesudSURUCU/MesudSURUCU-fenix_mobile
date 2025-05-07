import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/usecases_provider.dart';
import 'home_state.dart';

class HomeViewModel extends StateNotifier<HomeState> {
  final Ref ref;

  HomeViewModel(this.ref) : super(HomeState.initial()) {
    fetchTrendingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final movies = await ref.read(getTrendingMoviesProvider).call();
      state = state.copyWith(isLoading: false, movies: movies);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> searchMovies(String query) async {
    if (query.length < 2) {
      fetchTrendingMovies();
      return;
    }

    state = state.copyWith(isLoading: true, error: null);
    try {
      final movies = await ref.read(searchMoviesProvider).call(query);
      state = state.copyWith(isLoading: false, movies: movies);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) {
  return HomeViewModel(ref);
});
