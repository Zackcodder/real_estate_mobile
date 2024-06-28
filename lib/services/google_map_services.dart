// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_mobile/services/geo_location.dart';

class GoogleMapService {
  final GeoLocationService _geoLocationService = GeoLocationService();

  ///getting camera position
  CameraPosition? cameraPosition;
  CameraUpdate get cameraUpdate {
    return CameraUpdate.newCameraPosition(cameraPosition!);
  }

  /// returns camera position based on passed latitude and longitude
  LatLngBounds? _bounds;
  LatLngBounds? get bounds => _bounds;
  setBounds(LatLng southwest, LatLng northeast) =>
      _bounds = LatLngBounds(southwest: southwest, northeast: northeast);

  Future<LatLng?> get currentLocationLatLng async {
    Position position = await _geoLocationService.getCurrentPosition();

    if (position != null) {
      return LatLng(position.latitude, position.longitude);
    }
    return null;
  }

  CameraUpdate get latlngBoundsUpdate =>
      CameraUpdate.newLatLngBounds(bounds!, 50);

  static CameraPosition googlePlex =
      const CameraPosition(target: LatLng(6.5244, 3.3792), zoom: 16);

  convertPositionToLatLng(Position position) =>
      LatLng(position.latitude, position.longitude);
  convertDoubleToLatLng(double latitude, double longitude) =>
      LatLng(latitude, longitude);

  /// for circles
  final Set<Circle> _circles = <Circle>{};
  addCircle(Circle circles) => _circles.add(circles);
  clearCircles() => _circles.clear();
  Set<Circle> mainPageCircles(Position? pos) => pos == null
      ? {}
      : {
          Circle(
              circleId: const CircleId('user'),
              strokeColor: Colors.blue.withOpacity(0.9),
              strokeWidth: 2,
              radius: 350,
              center: convertPositionToLatLng(pos),
              fillColor: Colors.blue.withOpacity(0.1))
        };

  /// for markers
  Set<Marker> _markers = <Marker>{};
  Set<Marker> get markers => _markers;
  clearMarkers() => _markers.clear();
  addMarker(Marker marker) => _markers.add(marker);
  Future<Marker> createMarker({
    required String id,
    required LatLng position,
    required ImageConfiguration imageConfiguration,
    double? rotation,
    String? infoTitle,
    String? snippet,
    String? iconPath, // add this parameter
  }) async {
    BitmapDescriptor bitMapIcon =
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    if (iconPath != null) {
      bitMapIcon =
          BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    }

    return Marker(
      markerId: MarkerId(id),
      position: position,
      icon: bitMapIcon,
      rotation: rotation ?? 0.0,
      infoWindow: infoTitle != null
          ? InfoWindow(title: infoTitle, snippet: snippet)
          : InfoWindow.noText,
    );
  }

  /// user marker
  Future<void> updateUserLocationMarker() async {
    Position position = await _geoLocationService.getCurrentPosition();
    LatLng userLatLng = LatLng(position.latitude, position.longitude);

    BitmapDescriptor customIcon =
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);

    Marker userMarker = Marker(
      markerId: const MarkerId('user_location'),
      position: userLatLng,
      icon: customIcon,
    );

    _markers = {userMarker};
  }

  ///for polylines
  // static final PolylinePoints _polylinePoints = PolylinePoints();
  // static final ValueNotifier<Map<PolylineId, Polyline>> _polyLines =
  //     ValueNotifier({});
  // static ValueNotifier<Map<PolylineId, Polyline>> get polyLines => _polyLines;
  // Future<BitmapDescriptor> getCustomIcon(String assetPath, Size size) async {
  //   return await BitmapDescriptor.fromAssetImage(
  //     ImageConfiguration(size: size),
  //     assetPath,
  //   );
  // }

  // static createPolyLine(
  //   String polylineId,
  //   PointLatLng pickupLocation,
  //   PointLatLng destinationLocation,
  // ) async {
  //   PolylineId pId = PolylineId(polylineId);

  //   // Load custom icons
  //   // BitmapDescriptor startIcon = await getCustomIcon(
  //   //   'assets/images/pickup_icon.png',
  //   //   const Size(10, 10),
  //   // );
  //   // BitmapDescriptor endIcon = await getCustomIcon(
  //   //   'assets/images/destination_icon.png',
  //   //   const Size(10, 10),
  //   // );

  //   // Get route points
  //   List<LatLng> points =
  //       await _getRouteBetweenLocations(pickupLocation, destinationLocation);

  //   Polyline polyLine = Polyline(
  //     polylineId: pId,
  //     color: Colors.orange,
  //     points: points,
  //     jointType: JointType.round,
  //     width: 5,
  //     startCap: Cap.customCapFromBitmap(
  //         BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
  //     endCap: Cap.customCapFromBitmap(
  //         BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)),

  //     // startCap: Cap.customCapFromBitmap(startIcon),
  //     // endCap: Cap.customCapFromBitmap(endIcon),

  //     geodesic: true,
  //   );
  //   _polyLines.value = {};
  //   _polyLines.value = {pId: polyLine};
  // }

  // static Future<List<LatLng>> _getRouteBetweenLocations(
  //   PointLatLng pickupLocation,
  //   PointLatLng destinationLocation,
  // ) async {
  //   PolylineResult result = await _polylinePoints.getRouteBetweenCoordinates(
  //     LocationService.mapKey,
  //     pickupLocation,
  //     destinationLocation,
  //     travelMode: TravelMode.driving,
  //     optimizeWaypoints: true,
  //   );
  //   List<LatLng> polylineCoordinates = [];

  //   if (result.points.isNotEmpty) {
  //     for (var point in result.points) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     }
  //   }
  //   return polylineCoordinates;
  // }

  // // Future<void> addStartAndEndMarkers({
  // //   required LatLng startPosition,
  // //   required LatLng endPosition,
  // // }) async {
  // //   BitmapDescriptor startIcon = await getCustomIcon(
  // //     'assets/images/pickup_icon.png',
  // //     const Size(10, 10),
  // //   );
  // //   BitmapDescriptor endIcon = await getCustomIcon(
  // //     'assets/images/destination_icon.png',
  // //     const Size(10, 10),
  // //   );
  // //
  // //   Marker startMarker = Marker(
  // //     markerId: const MarkerId('pickUp'),
  // //     position: startPosition,
  // //     icon: startIcon,
  // //     infoWindow: const InfoWindow(title: 'PickUp'),
  // //   );
  // //
  // //   Marker endMarker = Marker(
  // //     markerId: const MarkerId('destination'),
  // //     position: endPosition,
  // //     icon: endIcon,
  // //     infoWindow: const InfoWindow(title: 'Destination'),
  // //   );
  // //
  // //   clearMarkers();
  // //   addMarker(startMarker);
  // //   addMarker(endMarker);
  // // }

  // clearPolyLines() => _polyLines.value.clear();
}
