import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocationExample(),
    );
  }
}

class LocationExample extends StatefulWidget {
  @override
  _LocationExampleState createState() => _LocationExampleState();
}

class _LocationExampleState extends State<LocationExample> {
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LocationData? _locationData;

  Future<void> _getLocation() async {
    // Kiểm tra dịch vụ vị trí
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) return;
    }

    // Kiểm tra quyền truy cập vị trí
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    // Lấy vị trí hiện tại
    _locationData = await location.getLocation();

    setState(() {}); // Cập nhật giao diện
    _openMap();
  }

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _openMap() async {
    final googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${_locationData!.latitude},${_locationData!.longitude}');
    final appleMapsUrl = Uri.parse(
        'https://maps.apple.com/?q=${_locationData!.latitude},${_locationData!.longitude}');

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else if (await canLaunchUrl(appleMapsUrl)) {
      await launchUrl(appleMapsUrl);
    } else {
      throw 'Không thể mở bản đồ.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Location Example')),
      body: Center(
        child: _locationData == null
            ? const CircularProgressIndicator()
            : Text(
                'Latitude: ${_locationData!.latitude}, Longitude: ${_locationData!.longitude}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
