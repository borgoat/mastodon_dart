import 'dart:async';

import '../../src/mock/endpoints/mutes.dart';
import '../library.dart';

mixin Mutes on Authentication, Utilities implements MockMutes {
  /// GET /api/v1/mutes
  ///
  /// - authentication (requires user)
  /// - read:mutes follow
  Future<List<Account>> mutes({int limit = 40}) async {
    final response = await (request(
      Method.get,
      "/api/v1/mutes",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    ) as FutureOr<Response>);

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body
        .map((m) => Account.fromJson(m as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/v1/accounts/:id/mute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  Future<Relationship> muteAccount(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/accounts/$id/mute",
      authenticated: true,
    ) as FutureOr<Response>);

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  Future<Relationship> unmuteAccount(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/accounts/$id/unmute",
      authenticated: true,
    ) as FutureOr<Response>);

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/mute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  Future<Status> muteStatus(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/statuses/$id/mute",
      authenticated: true,
    ) as FutureOr<Response>);

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  Future<Status> unmuteStatus(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/statuses/$id/unmute",
      authenticated: true,
    ) as FutureOr<Response>);

    return Status.fromJson(json.decode(response.body));
  }
}
