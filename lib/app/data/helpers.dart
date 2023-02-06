import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

class Helpers {
  Helpers._();
  static ProgressDialog? pr;
  static dynamic loadingDialog(BuildContext context) {
    pr = ProgressDialog(context);
    pr = ProgressDialog(context,
        type: ProgressDialogType.normal, isDismissible: false, showLogs: true);
    //show with percentage

    pr!.style(
        message: 'Loading....'.tr,
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: Container(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                // height: Get.height * 0.50,
                child: Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.pinkAccent,
              // leftDotColor: AppColors.primaryColor,
              // rightDotColor: AppColors.redColor,
              size: 50,
            )))),
        elevation: 10.0,
        insetAnimCurve: Curves.fastOutSlowIn,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: const TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: const TextStyle(
            color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600));

    return pr;
  }

  static showSnackbar(
      {String title = '',
      String message = '',
      Color colorText = Colors.white,
      Color backgroundColor = Colors.black54,
      int seconds = 3}) {
    Get.snackbar(title, message,
        colorText: colorText,
        backgroundColor: backgroundColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: seconds));
  }

  static BoxShadow customBoxShadow() {
    return BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1.0,
        blurRadius: 6,
        offset: const Offset(0, 0));
  }

  static int differenceBetweenTowDate(
          {required String start, required String end}) =>
      (DateTime.parse(end).difference(DateTime.parse(start)).inDays);

  static BoxShadow customCourseBoxShadow() {
    return BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 1.0,
        blurRadius: 4,
        offset: const Offset(0, 0));
  }

  static BoxShadow customButtonBoxShadow() {
    return BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1.0,
        blurRadius: 6,
        offset: const Offset(0, 0));
  }

  static String stringToDoubleFixed({required String price, int fixed = 0}) {
    return double.parse(price).toStringAsFixed(fixed);
  }

  static String replaceBanglaNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], bangla[i]);
    }

    return input;
  }

  static Future<void> showComingEmoji(BuildContext context) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: Get.width - 10,
              height: 400,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Container(
                    color: Colors.white,
                    child: Image.asset(
                      'assets/images/coming_soon.png',
                      fit: BoxFit.cover,
                      height: Get.width / 2.27,
                      width: Get.width / 1.887,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'ফিচারটি শীঘ্রই SOS এপে যুক্ত হবে। সাথে থাকার জন্য ধন্যবাদ ।',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xffE6A760),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'HindSiliguri',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 90,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xffE6A760),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'OK',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20,
                            color: Color(0xffE6A760),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'HindSiliguri',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static String backIcon = "assets/icons/back-left.png";
}
