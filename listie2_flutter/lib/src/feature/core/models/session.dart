// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listie2_client/listie2_client.dart';
import "package:serverpod_auth_client/module.dart";

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const Session._();

  factory Session({
    UserInfo? user,
    Profile? profile,
  }) = _Session;

  bool get isAuthenticated {
    return user != null;
  }
}
