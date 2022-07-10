import 'dart:math' show cos, sin, acos;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/controller/location_controller.dart';
import 'package:firebase_demo/model/model_city.dart';
import 'package:get/get.dart';

class CityController extends GetxController {
  RxList<ModelCity> listOfCity = <ModelCity>[].obs;
  RxBool isCityLoading = false.obs;

  final pi = 3.14;

  @override
  void onInit() async {
    retrieveCities();
    super.onInit();
  }

  retrieveCities() async {
    isCityLoading.value = true;
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection("cities").get();
      listOfCity.value = snapshot.docs
          .map((docSnapshot) => ModelCity.fromDocumentSnapshot(docSnapshot))
          .toList();
      isCityLoading.value = false;
    } catch (_) {
      isCityLoading.value = false;
    }
  }

  String distance(double lat2, double lon2) {
    LocationController locationController = Get.find();
    if (locationController.latitude.isEmpty ||
        locationController.longitude.isEmpty) {
      return "0 KM";
    }
    double lat1 = double.parse(locationController.latitude);
    double? lon1 = double.parse(locationController.longitude);

    double theta = lon1 - lon2;
    double dist = sin(deg2rad(lat1)) * sin(deg2rad(lat2)) +
        cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * cos(deg2rad(theta));
    dist = acos(dist);
    dist = rad2deg(dist);
    dist = dist * 60 * 1.1515;

    dist = dist * 1.609344;
    return dist.toStringAsFixed(2) + " KM";
  }

  double deg2rad(double deg) {
    return (deg * pi / 180.0);
  }

  double rad2deg(double rad) {
    return (rad * 180.0 / pi);
  }
}
