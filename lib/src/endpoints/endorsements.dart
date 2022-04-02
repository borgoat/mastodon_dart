import 'dart:async';

import '../../src/mock/endpoints/endorsements.dart';
import '../library.dart';

mixin Endorsements on Authentication, Utilities implements MockEndorsements {
  /// GET /api/v1/endorsements
  ///
  /// - authenticated
  /// - read read:account
  Future<List<Account>> endorsements() async {
    final response = await (request(
      Method.get,
      "/api/v1/endorsements",
      authenticated: true,
    ) as FutureOr<Response>);

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body
        .map((m) => Account.fromJson(m as Map<String, dynamic>))
        .toList();
  }

  /// POST /api/v1/accounts/:id/pin
  ///
  /// - authenticated
  /// - write write:accounts
  Future<Relationship> pin(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/accounts/$id/pin",
      authenticated: true,
    ) as FutureOr<Response>);

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unpin
  ///
  /// - authenticated
  /// - write write:accounts
  Future<Relationship> unpin(String id) async {
    final response = await (request(
      Method.post,
      "/api/v1/accounts/$id/unpin",
      authenticated: true,
    ) as FutureOr<Response>);

    return Relationship.fromJson(json.decode(response.body));
  }
}
