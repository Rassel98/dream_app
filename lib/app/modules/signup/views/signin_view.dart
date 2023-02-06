import 'package:dream_app/app/modules/signup/views/sign_up_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignInView extends GetView {
  const SignInView({Key? key}) : super(key: key);
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
      body: SafeArea(
        child: GetBuilder<SignupController>(
            init: SignupController(),
            builder: (controller) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      'Welcome back',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'HindSiliguri',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Manage your Dreams',
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'HindSiliguri',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),

                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: controller.nameController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          labelText: "User Name",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        obscureText: controller.isObscure,
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          labelText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFFFF4891),
                            ),
                            onPressed: () => controller.setObscure(),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(alignment: Alignment.centerLeft,
                        child: TextButton(onPressed: (){}, child: const Text('Forgot Password?'))),
                    const SizedBox(height: 10),

                    SizedBox(
                      height: 55,
                      width: double.maxFinite,
                      child: TextButton(
                        onPressed: () {
                           controller.userLogin();
                         // Get.offAndToNamed(Routes.HOME);
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color(0xffE7E2F9),
                        ),
                        child: Text("Sign In".toUpperCase(),style: const TextStyle(color: Color(0xffB6A8ED)),),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text('''You don't have account'''),
                        TextButton(onPressed: ()=>Get.to(const SignUpView(),transition: Transition.zoom), child: const Text('Signup')),
                      ],
                    )
                    // Divider(
                    //   color: Colors.grey.shade500,
                    // ),

                  ],
                ),
              );
            }),
      ),
    );
  }
}
