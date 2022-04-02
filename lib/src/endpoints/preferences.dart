import 'dart:async';

import '../../src/mock/endpoints/preferences.dart';
import '../data/preferences.dart';
import '../library.dart';

/// Preferred common behaviors to be shared across clients.
/// https://docs.joinmastodon.org/methods/accounts/preferences/
mixin Preferences on Authentication, Utilities implements MockPreferences {
  /// GET /api/v1/preferences
  ///
  /// token + read:accounts
  Future<UserPreferences> preferences() async {
    final response = await (request(
      Method.get,
      "/api/v1/preferences",
    ) as FutureOr<Response>);

    return UserPreferences.fromJson(json.decode(response.body));
  }
}
