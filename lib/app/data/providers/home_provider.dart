import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../modules/signup/controllers/signup_controller.dart';
import '../api_confiq.dart';
import '../helpers.dart';
import '../model/deram_model.dart';
import 'package:http/http.dart'as http;

import '../model/wallet_model.dart';

class HomeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Map<String, String> headerData = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
    'Token ${SignupController().to.prefs.getString('token')}',
  };
  // final GetConnect _connect = GetConnect(
  //   timeout: const Duration(seconds: 10),
  // );
  Future<bool> createNewDreams(
      {required String description,
        required String dreamName,
        required XFile imagePath}) async {
    String url = "${AppConfig.baseUrl}${AppConfig.apiVersion}dream-create-and-get/";
    print('$url');
    Map<String, String> headerFrom = {
      // 'Content-Type': 'multipart/form-data',
      //  'Accept': 'multipart/form-data',
      'Authorization':
      'Token ${SignupController().to.prefs.getString('token')}',
    };

    // File file = File(imagePath.path);
    // print(bodyData);
    final xpath = imagePath.path;
    final bytes = await File(xpath).readAsBytesSync();
    String fileName = imagePath.path.split("/").last;
    List<int> dfafa = bytes;
    try {
      var bodyData = {"sex": "MALE", "profile_picture": null};
      final form = FormData({
        "photo": MultipartFile(File(imagePath.path).readAsBytesSync(),
            filename: 'fileName.jpg',
          contentType: 'multipart/form-data',
        ),
        "description":description,
        "dream_name": dreamName,

      });

     //Response response = await post(url, form, headers: headerFrom);

      var request =
      http.MultipartRequest("POST", Uri.parse(url))
        ..headers.addAll(headerData);
      var stream=await http.ByteStream(imagePath.openRead());
      stream.cast();
      var length=await imagePath.length();
     // request.files.add(await http.MultipartFile('photo', stream, length));
      request.files.add(http.MultipartFile.fromBytes(
          "photo", File(imagePath.path).readAsBytesSync(),
          filename: 'jkdgj.jpg'));
      request.fields["description"]=description;
      request.fields["dream_name"]=dreamName;
print('okjkdgdflsjglodfg dgijfdg');

      var response = await request.send();

      print(response.stream.toString());
      print('${response.statusCode}');
     //print(response.body["detail"]);
      if (response.statusCode == 201) {
        return true;
      } else {
        //Helpers.showSnackbar(title: 'Error', message: response.body["detail"]);
        return false;

      }
    } catch (error) {
      print('user get profile error : $error');
    }
    return false;
  }


  Future<List<DreamModel>> getDreamList() async {
    String apiUrl = "${AppConfig.baseUrl}${AppConfig.apiVersion}dream-create-and-get/";

    print(SignupController().to.prefs.getString('token'));

    try {
      Response response = await get(apiUrl, headers: headerData);
      print(response.body);

      if (response.statusCode == 200) {
        return dreamModelFromJson(response.body['data']);
      } else {
        return [];
      }
    } catch (error) {
      print('get orders not found $error');
      return [];
    }
  }

  Future<WalletModel?> getWallet(String userId) async {
    String apiUrl = "${AppConfig.baseUrl}${AppConfig.apiVersion}dream-wallet/$userId/";
    try {
      Response response = await get(apiUrl, headers: headerData);
      print(response.body);

      if (response.statusCode == 201) {
        final model = WalletModel.fromJson(response.body['data']);
        return model;
      } else {
        return null;
      }
    } catch (error) {
      print('get orders not found $error');
      return null;
    }
  }

  Future<bool> postMilston(
      {required String amount,
        required int donationId,
        required String description,
        required int like
      }) async {
    try {
      String postUrl = '${AppConfig.baseUrl}${AppConfig.apiVersion}dream-fund-milestone/';
      Map<String, dynamic> bodyJson = {
        "amount": amount,
        "comment": description,
        "dream_donation_id": donationId,
        "like": like
      };
      print('$bodyJson');

      Response response = await post(postUrl, bodyJson,headers: headerData);
      print('${response.body}');
      print('${response.statusCode}');
      if (response.statusCode == 201) {

        return true;
      } else {
        print('else condition');
        Helpers.showSnackbar(title: 'Error', message: response.body["detail"]);
        return false;
      }
    } catch (exception) {
      print('catch block register');
      print('$exception');
      return false;
    }
  }

}
