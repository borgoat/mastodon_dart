import 'dart:async';

import '../../src/mock/endpoints/scheduled_statuses.dart';
import '../library.dart';

mixin ScheduledStatuses
    on Authentication, Utilities
    implements MockScheduledStatuses {
  /// GET /api/v1/scheduled_statuses
  ///
  /// - authenticated (requires user)
  /// - read read:statuses
  Future<List<ScheduledStatus>> scheduledStatuses() async {
    final response = await (request(
      Method.get,
      "/api/v1/scheduled_statuses",
      authenticated: true,
    ) as FutureOr<Response>);

    final body = List<Map>.from(json.decode(response.body));

    return body
        .map((m) => ScheduledStatus.fromJson(m as Map<String, dynamic>))
        .toList();
  }

  /// GET /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - read read:statuses
  Future<ScheduledStatus> scheduledStatus(String id) async {
    final response = await (request(
      Method.get,
      "/api/v1/scheduled_statuses/$id",
      authenticated: true,
    ) as FutureOr<Response>);

    return ScheduledStatus.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - write write:statuses
  Future<ScheduledStatus> updateScheduledStatus(String id,
      {DateTime? scheduledAt}) async {
    final response = await (request(
      Method.put,
      "/api/v1/scheduled_statuses/$id",
      authenticated: true,
      payload: {
        "scheduled_at": scheduledAt?.toIso8601String(),
      },
    ) as FutureOr<Response>);

    return ScheduledStatus.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - write write:statuses
  Future<dynamic> deleteScheduledStatus(String id) async {
    await request(
      Method.delete,
      "/api/v1/scheduled_statuses/$id",
      authenticated: true,
    );
  }
}
