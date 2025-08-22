import 'package:fgetx/app/services/albums_service.dart';
import 'package:flutter/material.dart';
import 'package:fgetx/app/data/models/albums_model.dart';

class DetailView extends StatelessWidget {
  final int albumId;

  const DetailView({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Album Detail")),
      body: FutureBuilder<AlbumsModel>(
        future: AlbumsService().fetchAlbumById(albumId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data found"));
          }

          final album = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title: ${album.title}", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text("Album ID: ${album.id}"),
                Text("User ID: ${album.userId}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
