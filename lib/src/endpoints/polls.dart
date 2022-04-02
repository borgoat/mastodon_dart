import 'dart:async';

import 'package:mastodon_dart/src/mock/endpoints/polls.dart';

import '../data/poll.dart';
import '../library.dart';

/// View and vote on polls attached to statuses. To discover poll ID,
/// you will need to GET a Status first and then check for a `poll` property.
///
/// https://docs.joinmastodon.org/methods/statuses/polls/
mixin Polls on Authentication, Utilities implements MockPolls {
  /// GET /api/v1/polls/:id
  ///
  /// - public if parent status is public
  /// - token + read:statuses if parent status is private
  Future<Poll> poll(String id) async {
    final response = await (request(
      Method.get,
      "/api/v1/polls/$id",
    ) as FutureOr<Response>);

    return Poll.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/polls/:id/votes
  ///
  /// - token + write:statuses
  Future<Poll> voteOnPoll(String id) async {
    final response = await (request(
      Method.get,
      "/api/v1/polls/$id/votes",
    ) as FutureOr<Response>);

    return Poll.fromJson(json.decode(response.body));
  }
}
