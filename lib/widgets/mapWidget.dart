import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_mobile/providers/map_provider.dart';
import 'package:real_estate_mobile/services/google_map_services.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewState();
}

class _MapViewState extends State<MapViewScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller = Completer();

  late MapViewProvider _mapViewProvider;

  @override
  void initState() {
    super.initState();
    _mapViewProvider = Provider.of<MapViewProvider>(context, listen: false);
    _mapViewProvider.startLocationUpdates();
    WidgetsBinding.instance.addObserver(this);
    setState(() {});
  }

  _polylineListener() async {
    await Future.delayed(const Duration(milliseconds: 1));
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _mapViewProvider.removeListener(_polylineListener);
    super.dispose();
  }

  final List<Map<String, dynamic>> properties = [
    {
      'title': 'Modern House',
      'price': '\$1,200,000',
      'location': const LatLng(37.7749, -122.4194),
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Luxury Villa',
      'price': '\$2,800,000',
      'location': const LatLng(37.7849, -122.4094),
      'image': 'https://via.placeholder.com/150'
    },
    // Add more properties here
  ];

  @override
  Widget build(BuildContext context) {
    final mapProvider = Provider.of<MapViewProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            compassEnabled: true,
            initialCameraPosition: GoogleMapService.googlePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            circles: mapProvider.circle,
            markers: properties
                .map((property) => Marker(
                      markerId: MarkerId(property['title']),
                      position: property['location'],
                      infoWindow: InfoWindow(
                        title: property['title'],
                        snippet: property['price'],
                      ),
                    ))
                .toSet(),
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
              mapController = controller;
              final position = await mapProvider.currentPosition;
              mapController.animateCamera(CameraUpdate.newLatLng(
                  mapProvider.convertPositionToLatLng(
                      position))); // Apply the dark map style
              // ignore: deprecated_member_use
              mapController.setMapStyle(_darkMapStyle);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  // Dark map style
  String _darkMapStyle = '''
  [
    {
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#212121"
        }
      ]
    },
    {
      "featureType": "administrative",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "administrative.country",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#9e9e9e"
        }
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "stylers": [
        {
          "visibility": "off"
        }
      ]
    },
    {
      "featureType": "administrative.locality",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#bdbdbd"
        }
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#181818"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.stroke",
      "stylers": [
        {
          "color": "#1b1b1b"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry.fill",
      "stylers": [
        {
          "color": "#2c2c2c"
        }
      ]
    },
    {
      "featureType": "road",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#8a8a8a"
        }
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#373737"
        }
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#3c3c3c"
        }
      ]
    },
    {
      "featureType": "road.highway.controlled_access",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#4e4e4e"
        }
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#616161"
        }
      ]
    },
    {
      "featureType": "transit",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#757575"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {
          "color": "#000000"
        }
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {
          "color": "#3d3d3d"
        }
      ]
    }
  ]
  ''';
}
