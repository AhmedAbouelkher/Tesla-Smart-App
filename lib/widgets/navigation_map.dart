import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'bottom_sheet.dart';

class NavigationMap extends StatelessWidget {
  NavigationMap({
    @required this.latitude,
    @required this.longitude,
    this.zoom = 13,
  });
  final double latitude;
  final double longitude;
  final double zoom;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          response.setHeight(20),
        ),
      ),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(latitude, longitude),
          zoom: zoom,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(latitude, longitude),
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_on,
                    size: 40,
                    color: Color(0xff353A40),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
