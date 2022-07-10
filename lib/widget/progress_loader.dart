import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressLoader extends StatelessWidget {
  const ProgressLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
