import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../formulir/controllers/formulir_controller.dart';
import '../../formulir/views/formulir_view.dart';

class FormulirOutputView extends StatelessWidget {
  const FormulirOutputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formulir = Get.find<FormulirController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Output'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama: ${formulir.nameController.text}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Kursus: ${formulir.selectedCourses.value}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Tanggal Kursus: ${formulir.formattedDate}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Jenis Kelamin: ${formulir.gender.value}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    formulir.clearForm();
                    Get.off(() => const FormulirView());
                  },
                  child: const Text('Kembali ke Form'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}