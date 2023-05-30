import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:listie2_client/listie2_client.dart';
import 'package:listie2_flutter/src/feature/core/components/base_component.dart';

class Avatar extends BaseComponent {
  final Profile? profile;
  final double size;

  const Avatar(this.profile, {super.key, this.size = 32});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(size / 2)),
      clipBehavior: Clip.antiAlias,
      child: profile != null && profile!.avatarUrl.isNotEmpty
          ? Image.network(
              profile!.avatarUrl,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            )
          : Placeholder(),
    );
  }
}
