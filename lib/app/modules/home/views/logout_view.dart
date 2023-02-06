import 'package:dream_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LogoutView extends StatelessWidget {
  const LogoutView({Key? key}) : super(key: key);

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
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Logout',style: TextStyle(
                  color: Colors.black,
                  fontSize: 30
              ),),

            const SizedBox(width: 5,),
            IconButton(onPressed: ()=>Get.offAndToNamed(Routes.SIGNUP),
                icon: const Icon(Icons.logout,color: Colors.red,))

          ],
        ),
      ),
    );
  }
}
