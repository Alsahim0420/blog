class OpinionModel {
  DateTime date;
  String name;
  String opinion;

  OpinionModel({
    required this.date,
    required this.name,
    required this.opinion,
  });

  factory OpinionModel.fromJson(Map<String, dynamic> json) => OpinionModel(
        date: DateTime.parse(json["date"]),
        name: json["name"],
        opinion: json["opinion"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "name": name,
        "opinion": opinion,
      };
}
