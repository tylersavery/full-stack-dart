import 'package:listie2_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class IngredientEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<Ingredient>> listAll(Session session) async {
    final userId = await session.auth.authenticatedUserId;

    if (userId == null) {
      return [];
    }

    return await Ingredient.find(
      session,
      where: (item) => item.userId.equals(userId),
    );
  }

  Future<List<Ingredient>> category(Session session, int categoryId) async {
    final userId = await session.auth.authenticatedUserId;

    if (userId == null) {
      return [];
    }

    return await Ingredient.find(
      session,
      where: (item) => item.userId.equals(userId) & item.categoryId.equals(categoryId),
    );
  }

  Future<bool> create(Session session, {required String name, required int categoryId, bool isChecked = false}) async {
    final userId = await session.auth.authenticatedUserId;
    if (userId == null) return false;

    final ingredient = Ingredient(
      userId: userId,
      name: name,
      categoryId: categoryId,
      isChecked: isChecked,
    );

    await Ingredient.insert(session, ingredient);
    return true;
  }

  Future<Ingredient?> toggleIsChecked(Session session, int itemId) async {
    final userId = await session.auth.authenticatedUserId;
    if (userId == null) return null;

    final ingredient = await Ingredient.findSingleRow(
      session,
      where: (item) => item.id.equals(itemId) & item.userId.equals(userId),
    );

    if (ingredient != null) {
      ingredient.isChecked = !ingredient.isChecked;
      await Ingredient.update(session, ingredient);
      return ingredient;
    }

    return null;
  }

  Future<Ingredient?> rename(Session session, {required int ingredientId, required String name}) async {
    final userId = await session.auth.authenticatedUserId;
    if (userId == null) return null;

    final ingredient = await Ingredient.findSingleRow(
      session,
      where: (item) => item.id.equals(ingredientId) & item.userId.equals(userId),
    );

    if (ingredient != null) {
      ingredient.name = name;
      await Ingredient.update(session, ingredient);
      return ingredient;
    }

    return null;
  }

  Future<bool> delete(Session session, int itemId) async {
    final userId = await session.auth.authenticatedUserId;
    if (userId == null) return false;

    final ingredient = await Ingredient.findSingleRow(
      session,
      where: (item) => item.id.equals(itemId) & item.userId.equals(userId),
    );

    if (ingredient != null) {
      await Ingredient.delete(session, where: (item) => item.id.equals(ingredient.id));
      return true;
    }

    return false;
  }
}
