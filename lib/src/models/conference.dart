import 'package:json_annotation/json_annotation.dart';

part 'conference.g.dart';

@JsonSerializable()
class Speaker {
  final String firstName;
  final String lastName;
  final String bio;
  final String avatar;

  Speaker({this.firstName, this.lastName, this.bio, this.avatar});

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);

  String get fullName => '$firstName $lastName';
}

@JsonSerializable()
class Room {
  final String name;

  Room({this.name});

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

enum Difficulty {
  EASY,
  MEDIUM,
  HARD,
}

@JsonSerializable()
class TechInfo {
  final List<String> themes;
  final Difficulty difficulty;

  TechInfo({this.themes, this.difficulty});

  factory TechInfo.fromJson(Map<String, dynamic> json) =>
      _$TechInfoFromJson(json);
}

String parseTime(String data) {
  return data.substring(0, data.length - 3);
}

String toTime(String data) => data;

@JsonSerializable()
class Conference {
  final String id;
  final String title;
  final DateTime date;

  @JsonKey(
    fromJson: parseTime,
    toJson: toTime,
  )
  final String startTime;

  @JsonKey(
    fromJson: parseTime,
    toJson: toTime,
  )
  final String endTime;

  @JsonKey(defaultValue: [])
  final List<Speaker> speakers;
  final Room room;
  final TechInfo techInfo;

  final String description;

  Conference({
    this.id = '',
    this.title = '',
    this.date,
    this.startTime = '',
    this.endTime = '',
    this.speakers = const [],
    this.room,
    this.techInfo,
    this.description = '',
  });

  factory Conference.fromJson(Map<String, dynamic> json) =>
      _$ConferenceFromJson(json);
}
