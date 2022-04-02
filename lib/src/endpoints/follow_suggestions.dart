import 'dart:async';

import '../../src/mock/endpoints/follow_suggestions.dart';
import '../library.dart';

mixin FollowSuggestions
    on Authentication, Utilities
    implements MockFollowSuggestions {
  /// GET /api/v1/suggestions
  ///
  /// - authenticated (requires user)
  /// - read
  Future<List<Account>> suggestions() async {
    final response = await (request(
      Method.get,
      "/api/v1/suggestions",
      authenticated: true,
    ) as FutureOr<Response>);

    final body = List<Map>.from(json.decode(response.body));

    return body
        .map((m) => Account.fromJson(m as Map<String, dynamic>))
        .toList();
  }

  /// DELETE /api/v1/suggestions/:account_id
  ///
  /// API docs claim this needs read permissions, but its probably write permissions
  ///
  /// - authenticated (requires user)
  /// - read
  Future<dynamic> removeSuggestion(String id) async {
    await request(
      Method.delete,
      "/api/v1/suggestions/$id",
      authenticated: true,
    );
  }
}
