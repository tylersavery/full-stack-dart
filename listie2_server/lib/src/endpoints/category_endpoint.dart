import 'package:listie2_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class CategoryEndpoint extends Endpoint {
  Future<List<Category>> listAll(Session session) async {
    return await Category.find(session);
  }
}
