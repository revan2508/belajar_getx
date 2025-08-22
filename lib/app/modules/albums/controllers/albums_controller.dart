import 'package:fgetx/app/services/albums_service.dart';
import 'package:get/get.dart';
import 'package:fgetx/app/data/models/albums_model.dart';


class AlbumsController extends GetxController {
  final AlbumsService _service = AlbumsService();

  var albums = <AlbumsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlbums();
  }

  void fetchAlbums() async {
    try {
      isLoading.value = true;
      final result = await _service.fetchAlbums();
      albums.value = result;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
