import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_client/listie2_client.dart';
import 'package:listie2_flutter/src/utils/api_client.dart';
import 'package:listie2_flutter/src/utils/singletons.dart';

class CategoryProvider extends StateNotifier<List<Category>> {
  final Ref ref;
  final client = singleton<ApiClient>().client.category;

  CategoryProvider(this.ref) : super([]) {
    init();
  }

  init() async {
    state = await client.listAll();
  }
}

final categoryProvider = StateNotifierProvider<CategoryProvider, List<Category>>(
  (ref) => CategoryProvider(ref),
);
