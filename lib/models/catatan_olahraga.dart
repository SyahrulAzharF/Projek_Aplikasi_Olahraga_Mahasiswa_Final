class AchievementOlahraga {
  String id;
  String duration;
  String activity;
  DateTime timestamp;

  AchievementOlahraga({
    required this.id,
    required this.duration,
    required this.activity,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'duration': duration,
      'activity': activity,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static AchievementOlahraga fromMap(Map<String, dynamic> map, String id) {
    return AchievementOlahraga(
      id: id,
      duration: map['duration'],
      activity: map['activity'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
