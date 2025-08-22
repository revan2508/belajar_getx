import 'package:get/get.dart';
import 'package:fgetx/app/data/models/albums_model.dart';

class AlbumsService extends GetConnect {
  Future<List<AlbumsModel>> fetchAlbums() async {
    final response = await get("https://jsonplaceholder.typicode.com/albums");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching albums");
    } else {
      final List<dynamic> data = response.body;
      return data.map((e) => AlbumsModel.fromJson(e)).toList();
    }
  }

  Future<AlbumsModel> fetchAlbumById(int id) async {
    final response = await get("https://jsonplaceholder.typicode.com/albums/$id");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Error fetching album detail");
    } else {
      return AlbumsModel.fromJson(response.body);
    }
  }
}
