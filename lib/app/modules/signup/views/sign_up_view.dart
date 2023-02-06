import 'package:dream_app/app/modules/signup/views/signin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignUpView extends GetView {
  const SignUpView({Key? key}) : super(key: key);

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
      //backgroundColor:const Color(0xfff637ec),
      body: GetBuilder<SignupController>(
        init: SignupController(),
        builder: (controller) => ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Create Account',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'HindSiliguri',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'Manage your Dreams',
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'HindSiliguri',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: controller.nameController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'HindSiliguri',
// color: HexColor('#7A7A7A'),
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "User Name ",
                  prefixIcon: Icon(
                    Icons.manage_accounts_outlined,
                    color: Colors.orange.shade500,
                  ),
                  hintStyle: TextStyle(
                      fontFamily: 'HindSiliguri',
                      color: Colors.grey.shade400,
                      fontSize: 16),
//hintStyle: const TextStyle(color: Colors.orangeAccent),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              alignment: Alignment.center,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: controller.emailController,
                textInputAction: TextInputAction.next,
                style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'HindSiliguri',
// color: HexColor('#7A7A7A'),
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Enter Email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.orange.shade500,
                  ),
                  hintStyle: TextStyle(
                      fontFamily: 'HindSiliguri',
                      color: Colors.grey.shade400,
                      fontSize: 16),
//hintStyle: const TextStyle(color: Colors.orangeAccent),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
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
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.orange.shade500,
                  ),
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
                  labelStyle: TextStyle(
                      fontFamily: 'HindSiliguri',
                      color: Colors.grey.shade400,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                obscureText: controller.isObscure,
                controller: controller.confirmPassController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.orange.shade500,
                  ),
                  labelText: "Confirm Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color(0xFFFF4891),
                    ),
                    onPressed: () => controller.setObscure(),
                  ),
                  labelStyle: TextStyle(
                      fontFamily: 'HindSiliguri',
                      color: Colors.grey.shade400,
                      fontSize: 16),
                ),
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: controller.isCheak.value,
                      onChanged: (value) {
                        controller.isCheak.value = value!;
                      }),
                ),
                const Text(
                  'I Agree To the',
                  style: TextStyle(fontSize: 11, color: Colors.black),
                ),
                const Text(
                  ' Terms and Service & Privacy Policy',
                  maxLines: 1,
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                ),
              ],
            ),
            const Spacer(),
            const SizedBox(
              width: double.infinity,
              height: 24,
            ),
            InkWell(
              splashColor: Colors.deepPurple,
              onTap: () {
                controller.userRegister();
                //Get.to(const SignInView(), transition: Transition.leftToRight);
              },
              child: Ink(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  //color: const Color(0xffe7e2f)),
                  color: Color(0xffE7E2F9),
                ),
                height: 50,
                width: double.maxFinite,
                child: const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        fontFamily: 'HindSiliguri',
                        color: Color(0xffB6A8ED),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
