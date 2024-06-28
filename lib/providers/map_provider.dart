import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_mobile/services/geo_location.dart';
import 'package:real_estate_mobile/services/google_map_services.dart';

class MapViewProvider extends ChangeNotifier {
  final GoogleMapService _googleMapService = GoogleMapService();
  final GeoLocationService _geoLocationService = GeoLocationService();

  dynamic _currentPosition;
  get currentPosition async =>
      _currentPosition ??= await _geoLocationService.getCurrentPosition();

  convertPositionToLatLng(position) =>
      _googleMapService.convertPositionToLatLng(position);
  get circle => _googleMapService.mainPageCircles(_currentPosition);
  get marker => _googleMapService.markers;
  // ValueNotifier<Map<PolylineId, Polyline>> get polyline =>
  //     GoogleMapService.polyLines;
  LatLngBounds? get bounds => _googleMapService.bounds;

  /// user marker
  Future<void> updateUserLocationMarker() async {
    await _googleMapService.updateUserLocationMarker();
    notifyListeners();
  }

  void startLocationUpdates() {
    Timer.periodic(Duration(seconds: 5), (timer) async {
      await updateUserLocationMarker();
    });
  }

  ///

  @override
  notifyListeners();
}
