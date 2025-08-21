import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

 RxInt count = 0.obs;

 void increment() {
  if (count.value < 50) {
    // Increment the count only if it's less than 10
    count.value++;
  } else {
    // Optionally, you can show a message or handle the case when count reaches 10
    Get.snackbar(
      'STOP',
       'Maksimal: 50',
       snackPosition: SnackPosition.TOP,
       backgroundColor: Colors.red,
       colorText: Colors.white,
       icon: Icon(Icons.warning, color: Colors.white),
      );
  }
 } 

  void decrement() {
    if (count.value > 0) {
      count.value--;
    } else {
      Get.snackbar("STOP!!!", "Nilai Sudah Mencapai 0",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          );
    }
  }

}