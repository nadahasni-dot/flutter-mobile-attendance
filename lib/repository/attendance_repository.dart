import '../models/attendance.dart';
import '../services/database_service.dart';

class AttendanceRepository {
  static Future<Attendance> create(Attendance attendance) async {
    final db = await DatabaseService.instance.database;

    final id = await db.insert(tableAttendances, attendance.toJson());
    return attendance.copy(id: id);
  }

  static Future<Attendance> readAttendance(int id) async {
    final db = await DatabaseService.instance.database;

    final maps = await db.query(
      tableAttendances,
      columns: AttendanceFields.values,
      where: '${AttendanceFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Attendance.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  static Future<List<Attendance>> readAllAttendances() async {
    final db = await DatabaseService.instance.database;

    const orderBy = '${AttendanceFields.createdAt} ASC';

    final result = await db.query(tableAttendances, orderBy: orderBy);

    return result.map((json) => Attendance.fromJson(json)).toList();
  }
}
