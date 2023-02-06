import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/common_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      transition: Transition.leftToRight,
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const CommonView(),
      transition: Transition.leftToRight,
      curve: Curves.easeIn,

      binding: SignupBinding(),
    ),
  ];
}
