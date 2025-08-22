import 'package:fgetx/app/modules/pemesanan_makanan/controllers/pemesanan_makanan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PemesananMakananOutputView extends StatelessWidget {
  PemesananMakananOutputView({super.key});
  final PemesananMakananController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rincian Pesanan"),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama: ${c.namaController.text}"),
                  Text("Tanggal: ${c.tanggalController.text}"),
                  const SizedBox(height: 20),
                  const Text(
                    "Daftar Pesanan:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (c.pesanan.isEmpty)
                    const Text("Belum ada pesanan."),
                  ...c.pesanan.entries.map((e) {
                    final item = c.menu.firstWhere((m) => m["nama"] == e.key);
                    return Text(
                      "${e.key} x${e.value} = Rp${item["harga"] * e.value}",
                    );
                  }),
                  const Divider(),
                  Text("Total Harga: Rp${c.totalHarga}"),
                  Text("Diskon: ${c.diskon * 100}%"),
                  Text(
                    "Total Bayar: Rp${c.totalBayar.toStringAsFixed(0)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        c.clearForm(); // reset data
                        Get.back(); // kembali ke halaman sebelumnya
                      },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Kembali"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9C8BB7), // Warna ungu
                    ),
                  ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
