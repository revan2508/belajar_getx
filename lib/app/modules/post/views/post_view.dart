// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:fgetx/app/modules/post/views/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class PostView extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts (GetX + GetConnect)")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.posts.isEmpty) {
          return Center(child: Text("No posts available"));
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(post.title ?? 'no title'),
                subtitle: Text(
                  post.body ?? 'no content',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // Pindah ke detail view
                  Get.to(() => PostDetailView(post: post));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
