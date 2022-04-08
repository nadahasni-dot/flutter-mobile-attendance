import 'package:flutter/material.dart';

class DetailAttendanceScreen extends StatefulWidget {
  const DetailAttendanceScreen({Key? key}) : super(key: key);

  @override
  State<DetailAttendanceScreen> createState() => _DetailAttendanceScreenState();
}

class _DetailAttendanceScreenState extends State<DetailAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Attendance')),
    );
  }
}
