import 'dart:async';
import 'package:apiurl/models/User.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapSample extends StatefulWidget {
  Geo userLoaction;
  MapSample({this.userLoaction});
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition locationn;

  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    locationn = CameraPosition(
      target: LatLng(
        double.parse(widget.userLoaction.lat),
        double.parse(widget.userLoaction.lng),
      ),
      zoom: 14.4746,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: locationn,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: openLocation,
          label: Text('location'),
          icon: Icon(Icons.add_location_alt)),
    );
  }

  openLocation() {
    MapsLauncher.launchCoordinates(
      double.parse(widget.userLoaction.lat),
      double.parse(widget.userLoaction.lng),
    );
  }
}
