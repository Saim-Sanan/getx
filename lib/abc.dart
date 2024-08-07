import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ABC extends StatelessWidget {
  const ABC({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    dynamic args = Get.arguments;
    final String title = args["title"];
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome $title"),
      ),
      body: Center(
        child: TextButton(
          child: Text("back"),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
