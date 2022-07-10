import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:firebase_demo/view/city/city.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  String latitude = "";
  String longitude = "";

  Future<void> permissionCheck(BuildContext context) async {
    bool isLocationGranted = await requestLocationPermission();
    if (isLocationGranted && Platform.isIOS) {
      getCurrentLocation();
    } else if (isLocationGranted) {
      bool isGPSEnabled = await _checkGps(context);
      if (isGPSEnabled) {
        getCurrentLocation();
      } else {
        Get.off(const City());
      }
    } else {
      Get.off(const City());
    }
  }

  Future<bool> requestLocationPermission({Function? onPermissionDenied}) async {
    if (await Permission.location.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }

  Future _gpsService(BuildContext context) async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      _checkGps(context);
      return null;
    } else {
      return true;
    }
  }

  Future<bool> _checkGps(BuildContext context) async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Can't get current location"),
                content:
                    const Text('Please make sure you enable GPS and try again'),
                actions: <Widget>[
                  TextButton(
                      child: const Text('Ok'),
                      onPressed: () {
                        const AndroidIntent intent = AndroidIntent(
                            action:
                                'android.settings.LOCATION_SOURCE_SETTINGS');
                        intent.launch();
                        Navigator.of(context, rootNavigator: true).pop();
                        _gpsService(context);
                      })
                ],
              );
            });
      }
      return false;
    } else {
      return true;
    }
  }

  void getCurrentLocation() async {
    var location = Location();
    late LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
      latitude = currentLocation.latitude.toString();
      longitude = currentLocation.longitude.toString();
      Get.off(const City());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
