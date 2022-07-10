import 'package:firebase_demo/controller/city_controller.dart';
import 'package:firebase_demo/controller/location_controller.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController(), fenix: true);
    Get.lazyPut(() => CityController(), fenix: true);
  }
}
