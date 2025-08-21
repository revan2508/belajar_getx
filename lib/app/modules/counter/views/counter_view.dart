import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);

  // Hindari mendefinisikan controller baru di sini,
  // karena GetView sudah memberikan akses ke controller lewat `controller`
  // Namun jika tetap ingin pakai `c`, bisa gunakan Get.find()
  final CounterController c = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'Hitung ke: ${c.count.value}',
                  style: TextStyle(fontSize: c.count.value.toDouble() + 14),
                )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: c.decrement,
                  child: const Text('Kurangi'),
                ),
                ElevatedButton(
                  onPressed: c.increment,
                  child: const Text('Tambah'),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
