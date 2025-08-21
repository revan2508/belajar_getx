import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed("/counter"),
              child: Text('Counter Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.toNamed("/formulir"),
              child: Text('Formulir Page'),
            )
          ],
        )
      ),
    );
  }
}
