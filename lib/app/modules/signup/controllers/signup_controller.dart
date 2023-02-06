import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/helpers.dart';
import '../../../data/providers/user_provider.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  SignupController get to => Get.find();

  late SharedPreferences prefs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPassController = TextEditingController();

  var isObscure = true;

  var isCheak = false.obs;

  setObscure() {
    isObscure = !isObscure;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    print('${prefs.getString('access_token')}');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }

  Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // print('Mobile');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // print('Wifi');
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      print('No Connection');
      return false;
    } else {
      return false;
    }
  }

  // Future<void> sentOtp() =>
  //     UserProvider().otpSent('+88' + phoneController.text);

  void userLogin() async {
    // isProcessing(true);
    try {
      final ProgressDialog progressDialog =
          Helpers.loadingDialog(Get.overlayContext!);
      // isProcessing(true);
      progressDialog.show();
      Future.delayed(const Duration(seconds: 2), () async {
        print("Printttttttttttttttttt after 3s");
        if (await checkInternetConnectivity()) {
          var resp = await UserProvider().postLogin(
              userName: nameController.text.trim(),
              password: passwordController.text.trim());
          print(prefs.getString('token'));

          if (resp == true && prefs.getString('token') != null) {
            //  final response = await UserProvider().getProfile();
            progressDialog.hide();
            Helpers.showSnackbar(
                title: 'Success', message: 'login successfully');
            nameController.clear();
            passwordController.clear();

            await Get.offAndToNamed(Routes.HOME);

          }
          else {
            progressDialog.hide();
            Helpers.showSnackbar(title: 'Error', message: 'Login fails'.tr);
          }
        } else {
          progressDialog.hide();
          Helpers.showSnackbar(title: 'Error', message: 'No Internet'.tr);
        }
      });
    } catch (e) {
      Helpers.showSnackbar(message: e.toString().tr);
      print(e);
    }
  }

  void userRegister() async {
    if (nameController.text == null || nameController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your name',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
    if (emailController.text == null || emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your Email',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    } else if (emailValid == false) {
      Get.snackbar(
        'Error',
        'Email is invalid!!!',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (passwordController.text == null || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter password',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    if (passwordController.text != confirmPassController.text) {
      Get.snackbar(
        'Error',
        'Confirm password is not match',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (!isCheak.value) {
      Get.snackbar(
        'Error',
        'Please Select Terms & Condition',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    try {
      final ProgressDialog progressDialog =
          Helpers.loadingDialog(Get.overlayContext!);
      if (await checkInternetConnectivity()) {
        progressDialog.show();
        var resp = await UserProvider().postRegister(
            userName: nameController.text.trim(),
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        if (prefs.getString('token') != null && resp == true) {
          progressDialog.hide();
          print('log in successfully');
          Helpers.showSnackbar(title: 'Success', message: 'Signup successfully');
          nameController.clear();
          emailController.clear();
          passwordController.clear();
          await Get.offAndToNamed(Routes.HOME);
        } else {
          progressDialog.hide();
          Helpers.showSnackbar(title: 'Error', message: 'Signup fails');
        }
      } else {
        Helpers.showSnackbar(title: 'Error', message: 'No Internet'.tr);
      }
    } catch (e) {
      Helpers.showSnackbar(message: 'pleas_provide_correct_information'.tr);
      print(e);
    }
  }
}
