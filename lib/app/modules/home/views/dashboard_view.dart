import 'package:cached_network_image/cached_network_image.dart';
import 'package:dream_app/app/modules/home/controllers/home_controller.dart';
import 'package:dream_app/app/modules/home/views/suport_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/api_confiq.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => controller.isLoadingDream.value
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: Colors.deepPurple, size: 50),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: controller.searchController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
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
                    Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: controller.getDreamList.length,
                      itemBuilder: (context, index) {
                        final model = controller.getDreamList[index];
                        print(model.photo);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            height: Get.height * 0.6734,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/images/profile.png'),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(model.userName!)
                                    ],
                                  ),
                                  trailing: Text(
                                    model.createdAt!.split('T')[0].toString(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: Get.height * 0.2244,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppConfig.imageBaseUrl}${model.photo}",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                "${AppConfig.imageBaseUrl}${model.photo}"),
                                            fit: BoxFit.cover,
                                            colorFilter: const ColorFilter.mode(
                                                Colors.red,
                                                BlendMode.colorBurn)),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                        child: LoadingAnimationWidget
                                            .stretchedDots(
                                      color: Colors.red,
                                      size: 50,
                                    )),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      alignment: Alignment.bottomRight,
                                      width: double.maxFinite,
                                      height: Get.height * 0.2244,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.withOpacity(0.2),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/car.jpg'),
                                              fit: BoxFit.fill)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert),
                                  ),
                                  title: Text(model.description!),
                                ),
                                Container(
                                  height: Get.height * 0.1683,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff866EE1),
                                        Color(0xff59D1D4),
                                      ]),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              model.dreamName!,
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Flexible(
                                                child: Text(
                                              '\$${model.amount}/\$${model.accountBalance}',
                                              style: TextStyle(fontSize: 30),
                                            )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            // Text(
                                            //     model.dreamName!,
                                            //   style: const TextStyle(fontSize: 18),
                                            // ),
                                          ],
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Color(0xffACE8E9),
                                          radius: 50,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xff59D1D4),
                                            radius: 45,
                                            child: Text(
                                              '${model.percentage}%',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (controller.countLike.value < 1) {
                                            controller.countLike.value = 1;
                                          }
                                        },
                                        child: Obx(
                                          () => Row(
                                            children: [
                                              const Icon(Icons.star),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(controller.countLike.value == 1
                                                  ? (model.like! + 1).toString()
                                                  : model.like.toString()),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.comment),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(model.comment.toString()),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // controller.getAllDreamList();
                                          Get.to(const SuportView(),
                                              arguments: model.id);
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Color(0xff866EE1),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: const Text(
                                              'Support',
                                              style:
                                                  TextStyle(color: Colors.white),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                ),
        ),
      ),
    );
  }
}
