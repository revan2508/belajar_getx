// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  // Tambah item POST di sini
  final List<_PageItem> pages = const [

    // _PageItem(
    //   title: 'Home Page',
    //   route: Routes.HOME,
    //   icon: Icons.home,
    //   color: Colors.blue,
    // ),
    _PageItem(
      title: 'Counter Page',
      route: Routes.COUNTER,
      icon: Icons.exposure_plus_1,
      color: Colors.green,
    ),
    _PageItem(
      title: 'Formulir Page',
      route: Routes.FORMULIR,
      icon: Icons.assignment,
      color: Colors.orange,
    ),
    _PageItem(
      title: 'Pemesan Makanan Page',
      route: Routes.PEMESANAN_MAKANAN,
      icon: Icons.food_bank_outlined,       // Icon untuk pemesanan makanan, bisa diganti sesuai selera
      color: Colors.purple,
    ),
    _PageItem(
      title: 'Post Page',
      route: Routes.POST,
      icon: Icons.article,       // Icon untuk post, bisa diganti sesuai selera
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: pages.length,
          separatorBuilder: (_, __) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final page = pages[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                leading: CircleAvatar(
                  backgroundColor: page.color.withOpacity(0.2),
                  child: Icon(page.icon, color: page.color),
                ),
                title: Text(
                  page.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () => Get.toNamed(page.route),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PageItem {
  final String title;
  final String route;
  final IconData icon;
  final Color color;

  const _PageItem({
    required this.title,
    required this.route,
    required this.icon,
    required this.color,
  });
}
