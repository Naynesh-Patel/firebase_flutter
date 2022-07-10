import 'package:firebase_demo/controller/city_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityItemCard extends GetView<CityController>{
  final int index;
  const CityItemCard(this.index,{Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            controller.listOfCity[index].image,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 5),
                Text(
                  controller.listOfCity[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                        controller.listOfCity[index].name.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ))
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(controller.listOfCity[index].ticket),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(controller.listOfCity[index].duration),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.compare_arrows_outlined,
                      color: Colors.grey,
                      size: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(controller.distance(
                        double.parse(controller.listOfCity[index].lat),
                        double.parse(
                            controller.listOfCity[index].long))),
                  ],
                ),
              ],
            ))
      ],
    );
  }

}