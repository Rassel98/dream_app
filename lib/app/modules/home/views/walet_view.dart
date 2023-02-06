import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../controllers/home_controller.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(

      body: Obx(
        () => controller.isLoadingDream.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.getWallet.availableBalance == null
                ? const Center(
                    child: Center(child: Text('Data not found',style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,color: Colors.red),)),
                  )
                : Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'My Dream Wallet',
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffA3A3A3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              alignment: Alignment.center,
                              height: 160,
                              width: double.maxFinite,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Available Balance',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '\$${controller.getWallet.availableBalance}',
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff866EE1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 4),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Withdraw Funds',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: const Text(
                          'Transactions',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        ),
                        trailing: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ),
                      controller.getWallet.transactionData!.isNotEmpty
                          ? Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemCount: controller
                                        .getWallet.transactionData!.length,
                                    itemBuilder: (context, index) {
                                      final model = controller
                                          .getWallet.transactionData![index];
                                      return ListTile(
                                        leading: const CircleAvatar(
                                          radius: 28,
                                          backgroundImage: AssetImage(
                                              'assets/images/profile.png'),
                                        ),
                                        title: Text(
                                          model.userName!,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        trailing: Text(
                                          '+\$${model.amount}',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    },
                                  )),
                            )
                          : Text('Data not found')
                    ],
                  ),
      ),
    );
  }
}
