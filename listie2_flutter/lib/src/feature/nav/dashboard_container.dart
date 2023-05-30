import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_flutter/src/feature/auth/components/account_dropdown.dart';
import 'package:listie2_flutter/src/feature/category/components/category_header.dart';
import 'package:listie2_flutter/src/feature/category/providers/category_provider.dart';
import 'package:listie2_flutter/src/feature/core/components/base_screen.dart';
import 'package:listie2_flutter/src/feature/ingredient/components/ingredient_card.dart';
import 'package:listie2_flutter/src/feature/ingredient/providers/ingredient_provider.dart';

class DashboardContainer extends BaseScreen {
  const DashboardContainer({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text("Listie 2.0"),
      actions: [AccountDropdown()],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, categoryIndex) {
        final category = categories[categoryIndex];

        final ingredients = ref.watch(ingredientProvider(category.id!));

        return Column(
          children: [
            CategoryHeader(category: category),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ingredients.length,
              itemBuilder: (context, ingredientIndex) {
                final ingredient = ingredients[ingredientIndex];
                return IngredientCard(
                  ingredient: ingredient,
                  index: ingredientIndex,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
