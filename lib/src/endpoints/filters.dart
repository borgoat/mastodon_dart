import 'dart:async';

import '../../src/mock/endpoints/filters.dart';
import '../library.dart';

mixin Filters on Authentication, Utilities implements MockFilters {
  /// GET /api/v1/filters
  ///
  /// - authenticated (requires user)
  /// - read read:filters
  Future<List<Filter>> filters() async {
    final response = await (request(
      Method.get,
      "/api/v1/filters",
      authenticated: true,
    ) as FutureOr<Response>);

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Filter.fromJson(m as Map<String, dynamic>)).toList();
  }

  /// POST /api/v1/filters
  ///
  /// - authenticated (requires user)
  /// - write write:filters
  Future<Filter> createFilter(
    String phrase,
    List<FilterContext> context, {
    bool? irreversible,
    bool? wholeWord,
    Duration? expiresIn,
  }) async {
    final response = await (request(
      Method.post,
      "/api/v1/filters",
      authenticated: true,
      payload: {
        "phrase": phrase,
        "context": context.map((c) => c.toString().split(".").last),
        "irreversible": irreversible?.toString(),
        "whole_word": wholeWord?.toString(),
        "expires_in": expiresIn?.inSeconds,
      }..removeWhere((_, value) => value == null),
    ) as FutureOr<Response>);

    return Filter.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/filters/:id
  ///
  /// - authenticated (requires user)
  /// - read read:filters
  Future<Filter> filter(String id) async {
    final response = await (request(
      Method.get,
      "/api/v1/filters/$id",
      authenticated: true,
    ) as FutureOr<Response>);

    return Filter.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/filters/:id
  ///
  /// - authenticated (requires user)
  /// - write write:filters
  Future<Filter> updateFilter(
    String id,
    String phrase,
    List<FilterContext> context, {
    bool? irreversible,
    bool? wholeWord,
    Duration? expiresIn,
  }) async {
    final response = await (request(
      Method.put,
      "/api/v1/filters/$id",
      authenticated: true,
      payload: {
        "phrase": phrase,
        "context": context.map((c) => c.toString().split(".").last),
        "irreversible": irreversible?.toString(),
        "whole_word": wholeWord?.toString(),
        "expires_in": expiresIn?.inSeconds,
      }..removeWhere((_, value) => value == null),
    ) as FutureOr<Response>);

    return Filter.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/filters/:id
  ///
  /// - authenticated (requires user)
  /// - write write:filters
  Future<Filter> deleteFilter(String id) async {
    final response = await (request(
      Method.delete,
      "/api/v1/filters/$id",
      authenticated: true,
    ) as FutureOr<Response>);

    return Filter.fromJson(json.decode(response.body));
  }
}
