import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../dummyData/hubData.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // 19.0513152, 72.9088000

  final Completer<GoogleMapController> _controller = Completer();
  final List<Marker> _markers = <Marker>[];
  bool isLocationSelected = false;

  String selectedHubName = '';
  String selectedHubAddress = '';

  void markerTapped(String name, String add) {
    setState(() {
      selectedHubName = name;
      selectedHubAddress = add;
      isLocationSelected = true;
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.0513152, 72.9088000),
    zoom: 14,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<Marker> list = hubData.asMap().entries.map((entry) {
      final int index = entry.key;
      final Map<String, String> hub = entry.value;

      return Marker(
        markerId: MarkerId('Hub$index'),
        position: LatLng(
          double.parse(hub['lat']!),
          double.parse(hub['long']!),
        ),
        infoWindow: InfoWindow(title: hub['name']),
        onTap: () {
          markerTapped(hub['name']!, hub['address']!);
        },
      );
    }).toList();

    _markers.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map Screen")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Text(
              "Select Hub",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            height: 450,
            width: double.infinity,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              elevation: 3,
              //Google Map
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                mapType: MapType.normal,
                compassEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set<Marker>.of(_markers),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          isLocationSelected
              ? Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hub Name: $selectedHubName",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Hub Address: $selectedHubAddress",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text("Next"),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLocationSelected = false;
                                });
                              },
                              child: const Text("Cancel"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : const Text(
                  "Please Select Hub to proceed..",
                  style: TextStyle(fontSize: 16),
                ),
        ],
      ),
    );
  }
}
