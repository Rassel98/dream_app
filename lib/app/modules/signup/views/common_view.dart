import 'package:dream_app/app/modules/signup/views/sign_up_view.dart';
import 'package:dream_app/app/modules/signup/views/signin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class CommonView extends GetView<SignupController> {
  const CommonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/screen.png',
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 90,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.to(const SignUpView(),
                        transition: Transition.leftToRight),
                    child: Container(
                      height: 50,
                      width: 350,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 11, horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                        color: Colors.white,
                      ),
                      child: const Text('Create an Account'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const SignInView(),
                          transition: Transition.leftToRight);
                    },
                    child: Container(
                      height: 50,
                      width: 350,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 11, horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white)),
                      child: const Text('Sign In'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
