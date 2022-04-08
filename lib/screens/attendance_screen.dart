import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/attendance_controller.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final _controller = Get.find<AttendanceController>();

  final _formKey = GlobalKey<FormState>();
  late GoogleMapController mapController;
  StreamSubscription<Position>? positionStream;

  TextEditingController inputName = TextEditingController();

  // TODO change master center point lat, lng attendance here
  final LatLng _center = const LatLng(-8.1735199, 113.6976335);

  final Set<Circle> _circles = {
    Circle(
      strokeWidth: 2,
      fillColor: Colors.greenAccent.withOpacity(0.3),
      strokeColor: Colors.greenAccent,
      circleId: const CircleId('center'),
      center: const LatLng(-8.1735199, 113.6976335),
      radius: 50,
    )
  };

  // TODO change marker info here
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('center'),
      position: LatLng(-8.1735199, 113.6976335),
      infoWindow: InfoWindow(
        title: 'Attendance point',
        snippet: 'Matahari Johar Plaza',
      ),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  listenLocationChange() async {
    try {
      await _controller.getCurrentLocation();

      positionStream = Geolocator.getPositionStream().listen(
        (Position position) {
          log('Location changed: ${position.toString()}');
          _controller.currentPosition = position;
        },
        cancelOnError: true,
      );
    } catch (e) {
      log('failed listen location change: ${e.toString()}');
      Fluttertoast.showToast(msg: 'Please enable your gps first');
      Get.back();
    }
  }

  @override
  void initState() {
    super.initState();
    listenLocationChange();
  }

  @override
  void dispose() {
    if (positionStream != null) {
      positionStream!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 18,
              ),
              circles: _circles,
              markers: _markers,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: inputName,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: 'Input your name',
                      labelText: 'Input your name',
                    ),
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please input your name';
                      }

                      if (value.isEmpty) {
                        return 'Please input your name';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _controller.submitAttendance(inputName.text.trim());
                      }
                    },
                    child: const Text('Save Attendance'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
