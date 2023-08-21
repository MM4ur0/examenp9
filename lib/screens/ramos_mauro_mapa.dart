import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
final List<_PositionItem> _positionItems = <_PositionItem>[];

enum _PositionItemType {
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue, this.latitude, this.longitude);

  final _PositionItemType type;
  final String displayValue;
  final double latitude;
  final double longitude;
}

class RamosMauroMapa extends StatefulWidget {
  const RamosMauroMapa({Key? key}) : super(key: key);

  @override
  State<RamosMauroMapa> createState() => _RamosMauroMapaState();
}

class _RamosMauroMapaState extends State<RamosMauroMapa> {
  bool _hasPermission = false;
  double? _latitude;
  double? _longitude;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _hasPermission
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(_latitude ?? 0, _longitude ?? 0),
                        zoom: 8.0,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId('ubicacion'),
                          position: LatLng(_latitude ?? 0, _longitude ?? 0),
                          infoWindow: const InfoWindow(title: 'Ubicación'),
                        ),
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Regresar"),
                  ),
                ],
              )
            : const Text(""),
      ),
    );
  }

  void _updatePositionList(_PositionItemType type, String displayValue,
      double latitude, double longitude) {
    _positionItems.add(_PositionItem(type, displayValue, latitude, longitude));
    setState(() {});
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      setState(() {
        _hasPermission = false;
      });
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();

    setState(() {
      _hasPermission = true;
      _latitude = position.latitude;
      _longitude = position.longitude;
    });

    _updatePositionList(
      _PositionItemType.position,
      position.toString(),
      position.latitude,
      position.longitude,
    );
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}
