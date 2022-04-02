import 'dart:async';

import '../../src/mock/endpoints/blocks.dart';
import '../library.dart';

mixin Blocks on Authentication, Utilities implements MockBlocks {
  /// GET /api/v1/blocks
  ///
  /// - authenticated (requires user)
  /// - read:blocks follow
  Future<List<Account>> blocks({int limit = 40}) async {
    final response = await (request(
      Method.get,
      "/api/v1/blocks",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    ) as FutureOr<Response>);

    final body = List<Map>.from(json.decode(response.body));

    return body
        .map((m) => Account.fromJson(m as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/v1/accounts/:id/block
  ///
  /// - authenticated (requires user)
  /// - write:blocks follow
  Future<Relationship> block(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/accounts/$id/block",
      authenticated: true,
    ) as FutureOr<Response>);

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unblock
  ///
  /// - authenticated (requires user)
  /// - write:blocks follow
  Future<Relationship> unblock(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/accounts/$id/unblock",
      authenticated: true,
    ) as FutureOr<Response>);

    return Relationship.fromJson(json.decode(response.body));
  }
}
