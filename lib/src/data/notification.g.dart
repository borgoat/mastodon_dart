// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
    );

const _$NotificationTypeEnumMap = {
  NotificationType.follow: 'follow',
  NotificationType.mention: 'mention',
  NotificationType.reblog: 'reblog',
  NotificationType.favourite: 'favourite',
};
