import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_client/listie2_client.dart';
import 'package:listie2_flutter/src/feature/core/components/base_component.dart';
import 'package:listie2_flutter/src/feature/ingredient/providers/ingredient_provider.dart';

class IngredientCard extends BaseComponent {
  final Ingredient ingredient;
  final int index;

  const IngredientCard({
    super.key,
    required this.ingredient,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(ingredientProvider(ingredient.categoryId).notifier);

    return Container(
      color: Colors.red.shade700,
      child: Dismissible(
        key: Key(ingredient.id.toString()),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          provider.delete(index);
        },
        child: Container(
          color: Theme.of(context).cardColor,
          child: Card(
            child: ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              title: Text(ingredient.name),
              trailing: Checkbox.adaptive(
                value: ingredient.isChecked,
                onChanged: (val) {
                  provider.toggleIsChecked(index);
                },
              ),
              onTap: () async {
                provider.newIngredientNameController.text = ingredient.name;

                final String? ingredientName = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Rename Ingredient"),
                      content: TextFormField(
                        controller: provider.newIngredientNameController,
                        autofocus: true,
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
                          child: Text("Save"),
                        )
                      ],
                    );
                  },
                );

                provider.newIngredientNameController.clear();

                if (ingredientName != null && ingredientName.trim().isNotEmpty) {
                  provider.rename(index, ingredientName);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
