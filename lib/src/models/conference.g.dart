// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) {
  return Speaker(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      bio: json['bio'] as String,
      avatar: json['avatar'] as String);
}

Map<String, dynamic> _$SpeakerToJson(Speaker instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'bio': instance.bio,
      'avatar': instance.avatar
    };

Room _$RoomFromJson(Map<String, dynamic> json) {
  return Room(name: json['name'] as String);
}

Map<String, dynamic> _$RoomToJson(Room instance) =>
    <String, dynamic>{'name': instance.name};

TechInfo _$TechInfoFromJson(Map<String, dynamic> json) {
  return TechInfo(
      themes: (json['themes'] as List)?.map((e) => e as String)?.toList(),
      difficulty:
          _$enumDecodeNullable(_$DifficultyEnumMap, json['difficulty']));
}

Map<String, dynamic> _$TechInfoToJson(TechInfo instance) => <String, dynamic>{
      'themes': instance.themes,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$DifficultyEnumMap = <Difficulty, dynamic>{
  Difficulty.EASY: 'EASY',
  Difficulty.MEDIUM: 'MEDIUM'
};

Conference _$ConferenceFromJson(Map<String, dynamic> json) {
  return Conference(
      id: json['id'] as String,
      title: json['title'] as String,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      startTime: json['startTime'] == null
          ? null
          : parseTime(json['startTime'] as String),
      endTime:
          json['endTime'] == null ? null : parseTime(json['endTime'] as String),
      speakers: (json['speakers'] as List)
              ?.map((e) => e == null
                  ? null
                  : Speaker.fromJson(e as Map<String, dynamic>))
              ?.toList() ??
          [],
      room: json['room'] == null
          ? null
          : Room.fromJson(json['room'] as Map<String, dynamic>),
      techInfo: json['techInfo'] == null
          ? null
          : TechInfo.fromJson(json['techInfo'] as Map<String, dynamic>),
      description: json['description'] as String);
}

Map<String, dynamic> _$ConferenceToJson(Conference instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'startTime':
          instance.startTime == null ? null : toTime(instance.startTime),
      'endTime': instance.endTime == null ? null : toTime(instance.endTime),
      'speakers': instance.speakers,
      'room': instance.room,
      'techInfo': instance.techInfo,
      'description': instance.description
    };
