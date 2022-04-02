// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) => Emoji(
      shortcode: json['shortcode'] as String?,
      staticUrl: json['static_url'] == null
          ? null
          : Uri.parse(json['static_url'] as String),
      url: json['url'] == null ? null : Uri.parse(json['url'] as String),
      visibleInPicker: json['visible_in_picker'] as bool?,
      category: json['category'] as String?,
    );
