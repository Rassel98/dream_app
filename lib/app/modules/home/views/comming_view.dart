import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: const Center(
        child: Text('Coming Soon',style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),),
      ),
    );
  }
}
