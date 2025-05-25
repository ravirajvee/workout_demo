import 'dart:convert';

List<WorkoutModel> workoutModelFromJson(String str) => List<WorkoutModel>.from(
    json.decode(str).map((model) => WorkoutModel.fromJson(model)));

class WorkoutModel {
  WorkoutModel({
    this.name,
    this.description,
    this.duration,
    this.difficulty,
    this.id,
  });

  WorkoutModel.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
    duration = json['duration'];
    difficulty = json['difficulty'];
    id = json['id'];
  }
  String? name;
  String? description;
  num? duration;
  String? difficulty;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    map['duration'] = duration;
    map['difficulty'] = difficulty;
    map['id'] = id;
    return map;
  }
}
