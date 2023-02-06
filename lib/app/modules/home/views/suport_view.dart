import 'package:dream_app/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuportView extends GetView {
  const SuportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Found Milston',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.amount = 15;
                        controller.container1.value =
                            !controller.container1.value;
                        controller.container2.value = false;
                        controller.container3.value = false;
                        controller.container4.value = false;
                      },
                      child: Obx(
                        () => Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: !controller.container1.value
                                  ? Colors.white
                                  : Colors.deepPurple),
                          child: Text(
                            '\$15',
                            style: TextStyle(
                                color: !controller.container1.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.amount = 25;
                        controller.container2.value =
                            !controller.container2.value;
                        controller.container1.value = false;
                        controller.container3.value = false;
                        controller.container4.value = false;
                      },
                      child: Obx(
                        () => Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: !controller.container2.value
                                  ? Colors.white
                                  : Colors.deepPurple),
                          child: Text(
                            '\$25',
                            style: TextStyle(
                                color: !controller.container2.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.amount = 50;
                        controller.container3.value =
                            !controller.container3.value;
                        controller.container2.value = false;
                        controller.container1.value = false;
                        controller.container4.value = false;
                      },
                      child: Obx(
                        () => Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: !controller.container3.value
                                  ? Colors.white
                                  : Colors.deepPurple),
                          child: Text(
                            '\$50',
                            style: TextStyle(
                                color: !controller.container3.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.amount = 100;
                        controller.container4.value =
                            !controller.container4.value;
                        controller.container2.value = false;
                        controller.container3.value = false;
                        controller.container1.value = false;
                      },
                      child: Obx(
                        () => Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: !controller.container4.value
                                  ? Colors.white
                                  : Colors.deepPurple),
                          child: Text(
                            '\$100',
                            style: TextStyle(
                                color: !controller.container4.value
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                const Center(
                    child: Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xff787C80))),
                  child: TextField(
                    controller: controller.amountController,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'HindSiliguri',
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Leave Comment'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff787C80))),
                  child: TextField(
                    controller: controller.commentController,
                    textInputAction: TextInputAction.done,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'HindSiliguri',
                        fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  splashColor: Colors.deepPurple,
                  onTap: () {
                    controller.donationAmount(id: Get.arguments as int);
                  },
                  child: Ink(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xffE7E2F9)),
                    height: 50,
                    width: double.maxFinite,
                    child: const Center(
                      child: Text(
                        'Donate',
                        style: TextStyle(
                            fontFamily: 'HindSiliguri',
                            color: Colors.white,
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
        ),
      ),
    );
  }
}
