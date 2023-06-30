class NameModel {
  final int? id;
  final String name;
  NameModel({this.id, required this.name});

  NameModel copy({int? id, String? name}) =>
      NameModel(id: id ?? this.id, name: name ?? this.name);

  static NameModel fromJson(Map<String, Object?> json) =>
      NameModel(id: json["_id"] as int?, name: json["names"] as String);

  Map<String, Object?> toJson() => {"_id": id, "names": name};
}
