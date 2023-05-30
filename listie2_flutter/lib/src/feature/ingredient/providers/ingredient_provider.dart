import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_client/listie2_client.dart';
import 'package:listie2_flutter/src/utils/api_client.dart';
import 'package:listie2_flutter/src/utils/singletons.dart';

class IngredientProvider extends StateNotifier<List<Ingredient>> {
  final int categoryId;
  final client = singleton<ApiClient>().client.ingredient;
  final newIngredientNameController = TextEditingController();

  final Ref ref;
  IngredientProvider(this.ref, this.categoryId) : super([]) {
    load();
  }

  load() async {
    state = await client.category(categoryId);
  }

  create({
    required String name,
    bool isChecked = false,
  }) async {
    await client.create(name: name, categoryId: categoryId, isChecked: isChecked);
    load();
  }

  toggleIsChecked(int index) async {
    final ingredient = state[index];
    final updatedIngredient = await client.toggleIsChecked(ingredient.id!);

    if (updatedIngredient != null) {
      state = [...state]
        ..removeAt(index)
        ..insert(index, updatedIngredient);
    }
  }

  rename(int index, String name) async {
    final ingredient = state[index];
    final updatedIngredient = await client.rename(ingredientId: ingredient.id!, name: name);

    if (updatedIngredient != null) {
      state = [...state]
        ..removeAt(index)
        ..insert(index, updatedIngredient);
    }
  }

  delete(int index) async {
    final ingredient = state[index];

    await client.delete(ingredient.id!);
  }
}

final ingredientProvider = StateNotifierProvider.family<IngredientProvider, List<Ingredient>, int>(
  (ref, categoryId) => IngredientProvider(ref, categoryId),
);
