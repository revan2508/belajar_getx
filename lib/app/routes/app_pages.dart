import 'package:get/get.dart';

import '../modules/albums/bindings/albums_binding.dart';
import '../modules/albums/views/albums_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/formulir/bindings/formulir_binding.dart';
import '../modules/formulir/views/formulir_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pemesanan_makanan/bindings/pemesanan_makanan_binding.dart';
import '../modules/pemesanan_makanan/views/pemesanan_makanan_view.dart';
import '../modules/post/bindings/post_binding.dart';
import '../modules/post/views/post_view.dart';

// ignore_for_file: constant_identifier_names, prefer_const_constructors

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
    ),
    GetPage(
      name: _Paths.FORMULIR,
      page: () => FormulirView(),
      binding: FormulirBinding(),
    ),
    GetPage(
      name: _Paths.POST,
      page: () => PostView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.PEMESANAN_MAKANAN,
      page: () => PemesananMakananView(),
      binding: PemesananMakananBinding(),
    ),
    GetPage(
      name: _Paths.ALBUMS,
      page: () => const AlbumsView(),
      binding: AlbumsBinding(),
    ),
  ];
}
