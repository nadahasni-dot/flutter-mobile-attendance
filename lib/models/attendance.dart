const String tableAttendances = 'tb_attendance';

class AttendanceFields {
  static final List<String> values = [
    /// Add all fields
    id, name, latitude, longitude, createdAt
  ];

  static const String id = '_id';
  static const String name = 'name';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String createdAt = 'createdAt';
}

class Attendance {
  final int? id;
  final String name;
  final double latitude;
  final double longitude;
  final DateTime createdAt;

  Attendance({
    this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
  });

  Attendance copy({
    final int? id,
    final String? name,
    final double? latitude,
    final double? longitude,
    final DateTime? createdAt,
  }) =>
      Attendance(
        id: id ?? this.id,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        createdAt: createdAt ?? this.createdAt,
      );

  static Attendance fromJson(Map<String, dynamic> json) => Attendance(
        id: json[AttendanceFields.id] as int?,
        name: json[AttendanceFields.name] as String,
        latitude: json[AttendanceFields.latitude] as double,
        longitude: json[AttendanceFields.longitude] as double,
        createdAt: DateTime.parse(json[AttendanceFields.createdAt] as String),
      );

  Map<String, dynamic> toJson() => {
        AttendanceFields.id: id,
        AttendanceFields.name: name,
        AttendanceFields.latitude: latitude,
        AttendanceFields.longitude: longitude,
        AttendanceFields.createdAt: createdAt.toIso8601String(),
      };
}
