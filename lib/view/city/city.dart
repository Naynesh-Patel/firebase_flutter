import 'package:firebase_demo/controller/city_controller.dart';
import 'package:firebase_demo/view/city/city_item_card.dart';
import 'package:firebase_demo/widget/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class City extends GetView<CityController> {
  const City({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "City Name".toUpperCase(),
          style: const TextStyle(
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: Obx(() => controller.isCityLoading.value
          ? const ProgressLoader()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: controller.listOfCity.length,
              itemBuilder: (context, index) {
                return CityItemCard(index);
              },
              separatorBuilder: (context, index) {
                return Container(
                    margin:
                        const EdgeInsets.only(top: 16, bottom: 16, left: 120),
                    width: Get.width,
                    height: 1,
                    color: Colors.grey[200]);
              },
            )),
    );
  }
}
