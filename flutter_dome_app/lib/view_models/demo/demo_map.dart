import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DemoGoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MapDemo();
  }
}

class MapDemo extends StatefulWidget {
  @override
  _MapDemoState createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.6454573, 120.3199791),
    zoom: 19,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _onGeoChanged(CameraPosition position) {
    print("position: " + position.target.toString());
    print("zoom: " + position.zoom.toString());
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  void _add() {
 //   var markerIdVal = MyWayToGenerateId();
    final MarkerId markerId = MarkerId('123');

    var l= LatLng(
      22.6454573,
      120.3199791,
    );
    print('---- ${l.latitude}   ${l.longitude}');

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: l,
      infoWindow: InfoWindow(title: '123', snippet: '*'),
      onTap: () {
      //  _onMarkerTapped(markerId);
      },
    );

    markers[markerId] = marker;
    print('${markers.length}');
  }

  @override
  Widget build(BuildContext context) {
    _add();
    return Scaffold(
      appBar: AppBar(
        title: Text('GoogleMap'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: true,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) {
          controller.getZoomLevel().then((v) => {
          print(v)
          });
          _controller.complete(controller);
        },
        onCameraMove: _onGeoChanged,

      ),
    );
  }
}
