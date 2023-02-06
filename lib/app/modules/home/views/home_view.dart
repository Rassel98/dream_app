import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'comming_view.dart';
import 'create_dream_view.dart';
import 'dashboard_view.dart';
import 'logout_view.dart';
import 'walet_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> pge = [
      const DashBoard(),
      const ComingSoonView(),
      const CreateDream(),
      const WalletPage(),
      const LogoutView()
    ];

    return Scaffold(
        body: Obx(() => pge[controller.index.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'Home',

                // backgroundColor: Colors.red,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                label: 'Market',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box,
                  color: Colors.black,
                ),
                label: 'Dream',
                //backgroundColor: Colors.purple,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.wallet,
                  color: Colors.black,
                ),
                label: 'Walet',
                // backgroundColor: Colors.pink,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.grid_view,
                  color: Colors.black,
                ),
                label: 'Menu',
                // backgroundColor: Colors.pink,
              ),
            ],
            currentIndex: controller.index.value,
            selectedItemColor: Colors.amber[800],
            onTap: (index) {
              controller.index.value = index;
            },
          ),
        ));
  }
}
