import 'package:firebase_demo/controller/location_controller.dart';
import 'package:firebase_demo/utils/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  LocationController locationController = Get.find();

  @override
  void initState() {
    locationController.permissionCheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetsPath.mapBackground,
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          const Center(
            child: Icon(
              Icons.location_on_outlined,
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
