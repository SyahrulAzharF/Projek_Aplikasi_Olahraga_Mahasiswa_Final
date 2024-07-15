class CatatanOlahraga {
  String id;
  String duration;
  String activity;
  DateTime timestamp;

  CatatanOlahraga({
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

  static CatatanOlahraga fromMap(Map<String, dynamic> map, String id) {
    return CatatanOlahraga(
      id: id,
      duration: map['duration'],
      activity: map['activity'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
