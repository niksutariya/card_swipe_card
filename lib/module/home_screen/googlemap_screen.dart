import 'package:card_swipe_task/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(data["latitude"] ?? 0.0, data["longitude"] ?? 0.0),
      ),
      onMapCreated: (controller) async {
        mapController = controller;
        await Future.delayed(const Duration(seconds: 1));
        homeController.getMarker(
            data["latitude"] ?? 0.0, data["longitude"] ?? 0.0);
        mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(data["latitude"] ?? 0.0, data["longitude"] ?? 0.0),
            15,
          ),
        );
        homeController.update();
      },
      markers: Set<Marker>.of(homeController.markers.value),
      myLocationEnabled: true,
      buildingsEnabled: false,
      mapToolbarEnabled: false,
      compassEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
    );
  }
}
