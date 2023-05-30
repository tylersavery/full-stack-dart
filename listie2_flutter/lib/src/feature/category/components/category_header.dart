import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_client/listie2_client.dart';
import 'package:listie2_flutter/src/feature/core/components/base_component.dart';
import 'package:listie2_flutter/src/feature/ingredient/providers/ingredient_provider.dart';

class CategoryHeader extends BaseComponent {
  const CategoryHeader({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ingredientProvider(category.id!).notifier);

    return Container(
      color: Colors.black87,
      child: ListTile(
        title: Text(category.name),
        trailing: IconButton(
          onPressed: () async {
            final String? ingredientName = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Ingredient"),
                  content: TextFormField(
                    controller: provider.newIngredientNameController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Ingredient Name...",
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(provider.newIngredientNameController.text);
                      },
                      child: Text("Add"),
                    )
                  ],
                );
              },
            );

            provider.newIngredientNameController.clear();

            if (ingredientName != null && ingredientName.trim().isNotEmpty) {
              print(ingredientName);
              provider.create(name: ingredientName);
            }
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
