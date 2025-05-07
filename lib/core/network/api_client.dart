import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_provider.dart';
import 'api_service.dart';

final apiClientProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});
