import 'dart:io';
import 'package:dream_app/app/data/model/deram_model.dart';
import 'package:dream_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../../../data/helpers.dart';
import '../../../data/model/wallet_model.dart';
import '../../../data/providers/home_provider.dart';
import '../../../routes/app_pages.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController

  final titleController = TextEditingController();
  final searchController = TextEditingController();
  final amountController = TextEditingController();
  final desController = TextEditingController();
  final commentController = TextEditingController();
  var index = 0.obs;
  var countLike = 0.obs;

  var container1=false.obs;
  var container2=false.obs;
  var container3=false.obs;
  var container4=false.obs;

  var selectImage = ''.obs;
  final ImagePicker _picker = ImagePicker();

  XFile? image;

  var isLoadingDream = true.obs;
  var amount = 0;


  final _getDreamList = <DreamModel>[].obs;
  List<DreamModel> get getDreamList => _getDreamList;

  final _getWallet = WalletModel().obs;
  WalletModel get getWallet => _getWallet.value;

  @override
  void onInit() async {
    super.onInit();
     index.value = 0;
    await getAllDreamList();
    await getWalletData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    commentController.dispose();
    desController.dispose();
    amountController.dispose();
    super.onClose();
  }

  Future<void> imagePick() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image!.path);
      selectImage.value = file.path;
      print('selected image path ${selectImage.value}');
    } else {
      Get.snackbar(
        'Error',
        'Can not select image',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    // final ProgressDialog progressDialog =
    // Helpers.loadingDialog(Get.overlayContext!);
    // if (await SignupController().to.checkInternetConnectivity()) {
    //
    //   progressDialog.show();
    //
    //   Map<String, String> headerData = {
    //     'Accept': 'application/json',
    //     'Content-Type': 'multipart/form-data',
    //     'Authorization':
    //     'Bearer ${SignupController().to.prefs.getString('token')}',
    //   };
    //   // var response = await ImageService().uploadFile(image!.path, image.name);
    //   // var request =
    //   // http.MultipartRequest("PUT", Uri.parse('AppUrl'.putUpdateProfileUrl))
    //   //   ..headers.addAll(headerData);
    //   // request.files.add(http.MultipartFile.fromBytes(
    //   //     "profile_pic", File(file.path).readAsBytesSync(),
    //   //     filename: file.path));
    //   // var response = await request.send();
    //   // print('resssssssssssssssssssss ${response}');
    //
    //   // var request =
    //   //     http.MultipartRequest('PUT', Uri.parse(AppUrl.putUpdateProfileUrl))
    //   //       ..headers.addAll(headerData)
    //   //       ..fields.addAll(data);
    //   // request.files
    //   //     .add(await http.MultipartFile.fromPath('profile_pic', image!.path));
    //   // print(
    //   //     'reqqqqqqqqqqqqqqqqqqqqqqqqqqq ${request.toString()} ${image.path}');
    //   // var response = await request.send();
    //   // print('resssssssssssssssssssss ${response}');
    //   // if (response != null) {
    //   //   // onInit();
    //   //   progressDialog.hide();
    //   // } else {
    //   //   progressDialog.hide();
    //   //   print('Not upload profile picture');
    //   // }
    // } else {
    //   progressDialog.hide();
    //   Helpers.showSnackbar(title: "Error", message: "No Internet Connection");
    // }
  }

  Future<void> profileImageUpdate(
      {required int userId, required XFile imagePath}) async {
    final ProgressDialog progressDialog =
        Helpers.loadingDialog(Get.overlayContext!);
    if (await SignupController().to.checkInternetConnectivity()) {
      // progressDialog.show();
      // var getResponse =
      // await HomeProvider().profileImageUpdate(userId, imagePath);
      // if (getResponse != null) {
      //   // print(getResponse);
      //
      //   // progressDialog.hide();
      //   // await getUserProfile();
      // } else {
      //   print(' profile not found');
      //   progressDialog.hide();
      // }
    } else {
      print(' no internet');
      Helpers.showSnackbar(title: "Error", message: "No Internet");
    }
  }

  Future<void> getAllDreamList() async {
    try {
      if (await SignupController().to.checkInternetConnectivity()) {
        isLoadingDream(true);
        var getResponse = await HomeProvider().getDreamList();

        if (getResponse != []) {
          _getDreamList.addAll(getResponse);
          print(getDreamList.length);

          isLoadingDream(false);
        } else {
          isLoadingDream(false);
        }
      } else {
        Get.snackbar('Error', 'No Internet');
      }
    } finally {
      isLoadingDream(false);
    }
  }

  Future<void> getWalletData() async {
    try {
      if (await SignupController().to.checkInternetConnectivity()) {
        isLoadingDream(true);
        var getResponse = await HomeProvider()
            .getWallet(SignupController().to.prefs.getString('user_id')!);
        if (getResponse != null) {
          _getWallet.value=getResponse;
          print('data length ${getWallet.transactionData!.length}');

          isLoadingDream(false);
        } else {
          isLoadingDream(false);
        }
      } else {
        Get.snackbar('Error', 'No Internet');
      }
    } finally {
      isLoadingDream(false);
    }
  }

  void donationAmount({required int id}) async {
    print('Danated at $id');
    if (amount == 0 && amountController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter or select amount',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    if (commentController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter password',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    try {
      final ProgressDialog progressDialog =
          Helpers.loadingDialog(Get.overlayContext!);
      if (await SignupController().to.checkInternetConnectivity()) {
        progressDialog.show();
        var resp = await HomeProvider().postMilston(
          like: countLike.value,
            amount: amountController.text.isNotEmpty
                ? amountController.text
                : amount.toString(),
            description: commentController.text.trim(),
            donationId: id);

        if (resp == true) {
          amountController.clear();
          amount = 0;
          progressDialog.hide();
          await getWalletData();
          Helpers.showSnackbar(title: 'Success', message: 'Danation success');
          await Get.offAndToNamed(Routes.HOME);
        } else {
          progressDialog.hide();
          Helpers.showSnackbar(title: 'Error', message: 'Danation fails');
        }
      } else {
        Helpers.showSnackbar(title: 'Error', message: 'No Internet'.tr);
      }
    } catch (e) {
      Helpers.showSnackbar(message: 'pleas_provide_correct_information'.tr);
      print(e);
    }
  }

  void createNewDreams() async {
    if (amountController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please Enter amount',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    if (image ==null) {
      Get.snackbar(
        'Error',
        'Please Select Image',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    try {
      final ProgressDialog progressDialog =
          Helpers.loadingDialog(Get.overlayContext!);
      if (await SignupController().to.checkInternetConnectivity()) {
        progressDialog.show();
        var resp = await HomeProvider().createNewDreams(
            dreamName: titleController.text,
            description: desController.text.trim(),
            imagePath: image!
        );

        if (resp == true) {
          image = null;
          titleController.clear();
          desController.clear();
          progressDialog.hide();
          Helpers.showSnackbar(title: 'Success', message: 'Created successfully');
          await Get.offAndToNamed(Routes.HOME);
        } else {
          progressDialog.hide();
          Helpers.showSnackbar(title: 'Error', message: 'fails');
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
