import 'package:get/get.dart';

import '../screens/attendance_screen.dart';
import '../screens/detail_attendance_screen.dart';
import '../screens/home_screen.dart';
import 'route_names.dart';

class AppPages {
  static final appPages = [
    GetPage(
      name: RouteNames.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RouteNames.attendanceScreen,
      page: () => const AttendanceScreen(),
    ),
    GetPage(
      name: RouteNames.detailAttendanceScreen,
      page: () => const DetailAttendanceScreen(),
    ),
  ];
}
