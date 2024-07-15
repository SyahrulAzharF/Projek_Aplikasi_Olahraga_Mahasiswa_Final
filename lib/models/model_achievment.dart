class ModelAchievment {
  String id;
  String duration;
  String calories;
  String activity;
  DateTime timestamp;

  ModelAchievment({
    required this.id,
    required this.duration,
    required this.calories,
    required this.activity,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'duration': duration,
      'calories': calories,
      'activity': activity,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static ModelAchievment fromMap(Map<String, dynamic> map, String id) {
    return ModelAchievment(
      id: id,
      duration: map['duration'],
      activity: map['activity'],
      calories: map['calories'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
