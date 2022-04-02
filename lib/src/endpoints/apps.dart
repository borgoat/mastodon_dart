import 'dart:async';

import '../../src/mock/endpoints/apps.dart';
import '../library.dart';

/// Register client applications that can be used to obtain OAuth tokens.
/// https://docs.joinmastodon.org/methods/apps/
mixin Apps on Authentication, Utilities implements MockApps {
  /// Create a new application to obtain OAuth2 credentials.
  ///
  /// POST /api/v1/apps
  Future<AuthenticatedApplication> appCredentials(
    Uri website, [
    String? redirectUris = "urn:ietf:wg:oauth:2.0:oob",
    String? clientName = "mastodon-dart",
    List<String>? scopes = const ["write", "read", "follow", "push"],
  ]) async {
    final response = await (request(
      Method.post,
      "/api/v1/apps",
      payload: {
        "client_name": clientName,
        "redirect_uris": redirectUris,
        "scopes": scopes!.join(" "),
        "website": website.toString(),
      },
    ) as FutureOr<Response>);

    return AuthenticatedApplication.fromJson(json.decode(response.body));
  }

  /// Confirm that the app's OAuth2 credentials work.
  ///
  /// GET /api/v1/apps/verify_credentials
  Future<Application> verifyAppCredentials() async {
    final response = await (request(
      Method.post,
      "/api/v1/apps/verify_credentials",
      authenticated: true,
    ) as FutureOr<Response>);

    return Application.fromJson(json.decode(response.body));
  }
}
