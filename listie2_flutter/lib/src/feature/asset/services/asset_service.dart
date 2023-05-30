import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:listie2_client/listie2_client.dart';
import 'package:listie2_flutter/src/utils/api_client.dart';
import 'package:listie2_flutter/src/utils/singletons.dart';

class AssetService {
  final client = singleton<ApiClient>().client;

  Future<String?> uploadImage(XFile image, [String? path]) async {
    path = path ?? "test.jpg";

    final uploadDescription = await client.asset.getUploadDescription(path);
    if (uploadDescription != null) {
      final uploader = FileUploader(uploadDescription);
      final length = (await image.readAsBytes()).length;
      final stream = image.openRead();
      await uploader.upload(stream, length);
      final success = await client.asset.verifyUpload(path);

      if (!success) {
        return null;
      }

      final Map<String, dynamic> decodedDesciption = jsonDecode(uploadDescription);
      return "${decodedDesciption['url']}/$path";
    }

    return null;
  }
}
