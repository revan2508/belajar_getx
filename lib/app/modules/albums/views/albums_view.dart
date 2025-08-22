import 'package:fgetx/app/modules/albums/controllers/albums_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_view.dart';

class AlbumsView extends GetView<AlbumsController> {
  const AlbumsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums (GetX + GetConnect)"),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.albums.isEmpty) {
          return const Center(child: Text("No albums found."));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.albums.length,
          itemBuilder: (context, index) {
            final album = controller.albums[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                title: Text(
                  album.title ?? 'No Title',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    'Album ID: ${album.id} — User ID: ${album.userId}',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                onTap: () => Get.to(() => DetailView(albumId: album.id!)),
              ),
            );
          },
        );
      }),
    );
  }
}
