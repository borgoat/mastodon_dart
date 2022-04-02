import 'dart:async';

import '../../src/mock/endpoints/search.dart';
import '../library.dart';

mixin Search on Authentication, Utilities implements MockSearch {
  /// GET /api/v2/search
  ///
  /// - authenticated
  /// - read read:search
  Future<Results> search(String q, {bool resolve = false}) async {
    final response = await (request(
      Method.get,
      "/api/v2/search",
      authenticated: true,
      payload: {
        "q": q,
        "resolve": resolve.toString(),
      },
    ) as FutureOr<Response>);

    return Results.fromJson(json.decode(response.body));
  }
}
