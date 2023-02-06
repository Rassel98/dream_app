import 'dart:io';
import 'package:dream_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateDream extends StatelessWidget {
  const CreateDream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: const Text(
          'Create Dream',
          style: TextStyle(color: Colors.black),
        )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            height: Get.height * 0.673,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: Color(0xff9E8BE7), width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Obx(
                        () => controller.selectImage.value != ''
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(controller.selectImage.value),
                                  fit: BoxFit.fill,
                                  width: double.maxFinite,
                                  height: Get.height * 0.2244,
                                ),
                              )
                            : Container(
                                alignment: Alignment.bottomRight,
                                width: double.maxFinite,
                                height: Get.height * 0.2244,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.2),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/car.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 5,
                        child: InkWell(
                          onTap: () {
                            print(
                                'jfksdlfdjgvfosfdsvfklsdfsdoigjb idf dfdf=-s-cx---fdwf , moiedvdefpsvmsv ');
                            controller.imagePick();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.camera,
                                  ),
                                  Text('Change ')
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Enter your dream',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff9E8BE7))),
                    child: TextField(
                      controller: controller.titleController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Descriptions',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    height: Get.height * 0.1683,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xff9E8BE7)),
                    ),
                    child: TextField(
                      controller: controller.desController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      maxLines: 15,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Amount',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xff9E8BE7))),
                    child: TextField(
                      controller: controller.amountController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(
            width: double.infinity,
            height: 24,
          ),
          InkWell(
            splashColor: Colors.deepPurple,
            onTap: () {controller.createNewDreams();
              // Get.to(const SignInView(), transition: Transition.leftToRight);
            },
            child: Ink(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xffE7E2F9),
              ),
              height: 55,
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
    );
  }
}
