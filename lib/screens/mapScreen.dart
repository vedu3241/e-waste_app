import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../dummyData/hubData.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.formData});
  final Map<String, dynamic> formData;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // 19.0513152, 72.9088000
  BitmapDescriptor customMarkerIcon = BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueOrange); // Change 'hueBlue' to the desired hue value

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

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.0513152, 72.9088000),
    zoom: 14,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //as per hubData making markers
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
    //List of markers set here to display
    _markers.addAll(list);
    print(widget.formData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      appBar: AppBar(title: const Text("Select Hub")),
      body: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.symmetric(
          //     vertical: 20,
          //   ),
          //   child: Text(
          //     "Select Hub",
          //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          //   ),
          // ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10),
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
                                onPressed: () {
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const ReqFormToHub(),
                                  //   ),
                                  // );
                                  QuickAlert.show(
                                    context: context,
                                    // onConfirmBtnTap: () {},
                                    type: QuickAlertType.success,
                                    text: "Req sent",
                                  );
                                },
                                child: const Text("Send request"),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 234, 88, 78)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isLocationSelected = false;
                                  });
                                },
                                child: const Text(
                                  "Cancel",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : const Text(
                  "Please Select Hub to proceed..",
                  style: TextStyle(fontSize: 16),
                ),
        ],
      ),
      //Mark and change camera to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getUserCurrentLocation().then((value) async {
            _markers.add(
              Marker(
                markerId: const MarkerId('SomeId'),
                icon: customMarkerIcon,
                position: LatLng(value.latitude, value.longitude),
                infoWindow: const InfoWindow(title: "My current location"),
              ),
            );
            CameraPosition cameraPosition = CameraPosition(
              zoom: 14,
              target: LatLng(value.latitude, value.longitude),
            );

            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(cameraPosition),
            );
            setState(() {});
          });
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
