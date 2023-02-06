import 'package:dream_app/app/modules/signup/controllers/signup_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api_confiq.dart';
import '../helpers.dart';

import 'package:get/get.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Map<String, String> headerData = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':
        'Token ${SignupController().to.prefs.getString('access_token')}',
  };

// register

  Future<bool> postRegister(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      String postUrl = '${AppConfig.baseUrl}${AppConfig.apiVersion}register/';
      Map<String, dynamic> bodyJson = {
        "username": userName,
        "email": email,
        "password": password
      };

      print('$bodyJson');

      Response response = await post(postUrl, bodyJson);
      print('${response.body}');
      print('${response.statusCode}');
      if (response.statusCode == 200) {
        print('${response.body}');
        await postLogin(userName: userName, password: password);
        return true;
      } else {
        print('else condition');
        Helpers.showSnackbar(title: 'Error', message: response.body["username"]);
        return false;
      }
    } catch (exception) {
      print('catch block register');
      print('$exception');
      return false;
    }
  }

  //sent otp

  Future<bool> logout() async {
    try {
      String postUrl = '${AppConfig.baseUrl}${AppConfig.apiVersion}logout/';

      Map<String, dynamic> bodyJson = {
        "phone_number": 'phone',
        "app_signature": 'appSignature',
      };
      Response response = await post(postUrl, bodyJson);
      if (response.statusCode == 200) {
        print('Otp sent in user mobile');
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      Helpers.showSnackbar(title: 'Error', message: '$exception');
      // return false;
    }
    return false;
  }

// login methode
  Future<bool> postLogin(
      {required String userName, required String password}) async {

    try {
      String postUrl = '${AppConfig.baseUrl}${AppConfig.apiVersion}login/';

      Map<String, dynamic> bodyJson = {
        "username": userName,
        "password": password
      };
      print('$bodyJson');

      Response response = await post(postUrl, bodyJson);
      print(response.body);

      print("statusCode from provider ${response.statusCode}");

      if (response.statusCode == 200) {
        bool isToken = await setUserToken(response.body);
        if (isToken) {
          return true;
        }
      } else {
        print('return false');
        return false;
      }
    } catch (exception) {
      Helpers.showSnackbar(title: 'Error', message: '$exception');
      return false;
    }
    return false;
  }

  // Future<bool> postLogin(
  //     {required String phone, required String password}) async {
  //   try {
  //     String postUrl = AppUrl.postUserLogin;
  //     Map<String, dynamic> bodyJson = {
  //       "phone_number": phone,
  //       "password": password
  //     };
  //     Response response = await post(postUrl, bodyJson);
  //     print(response.body);
  //
  //     if (response.statusCode == 200) {
  //       bool isToken = await setUserToken(response.body);
  //
  //       if (isToken) {
  //         print('==========log post====');
  //
  //         return isToken;
  //       } else {
  //         return false;
  //       }
  //     } else {
  //       return false;
  //     }
  //   } catch (exception) {
  //     Helpers.showSnackbar(title: 'Error', message: '$exception');
  //     return false;
  //   }
  // }
//
//   Future<bool> postSession(
//       {required int sessionId, required int cetegoryId}) async {
//     try {
//       String postUrl = AppUrl.postUserSession;
//       print(postUrl);
//       Map<String, dynamic> bodyJson = {
//         "session": sessionId,
//         "category": cetegoryId
//       };
//       Response response = await post(postUrl, bodyJson, headers: headerData);
//       print(response.body);
//
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (exception) {
//       Helpers.showSnackbar(title: 'Error', message: '$exception');
//       return false;
//     }
//   }
//

  Future<bool> setUserToken(jsonString) async {
    try {
      if (jsonString != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(' User Access token ${jsonString['token'].toString()}');
        print(' User Access token ${jsonString['expiry'].toString()}');
        await prefs.setString("expiry", jsonString["expiry"].toString());
        await prefs.setString("token", jsonString["token"].toString());
        await prefs.setString("user_id", jsonString[ "user_id"].toString());

        print('set user token done');

        return true;
      } else {
        return false;
      }
    } catch (e) {
      Helpers.showSnackbar(title: 'Error', message: '$e');
      throw Exception(e);
      // return false;
    }
  }
//
//   Future<ProfileModel?> getProfile() async {
//     String url = AppUrl.getProfileUrl;
//     print('$url');
//
//     try {
//       Response response = await get(url, headers: headerData);
//
//       if (response.statusCode == 200 && response.body['status'] == "success") {
//         print(response.body);
//
//         ProfileModel model = ProfileModel.fromJson(response.body['data']);
//         return model;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       print('user get profile error : $error');
//     }
//   }
//
//   Future<ProfileModel?> updateProfile(ProfileModel profileModel) async {
//     String url = AppUrl.putUpdateProfileUrl; //+ "${profileModel.id!}/"
//     // print('linkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk $url');
//     // print(
//     //     'alllllllllllllllll dataaaaaaaaaaaaaaaaaaaaaaaaa  ${profileModel.toJson()}');
//
//     Map bodyData = {
//       "id": profileModel.id,
//       "sex": profileModel.sex,
//       if (profileModel.address!.isNotEmpty) "address": profileModel.address,
//       if (profileModel.birthDayForSave!.isNotEmpty)
//         "date_of_birth": profileModel.birthDayForSave,
//       if (profileModel.department != null)
//         "department": profileModel.department,
//       if (profileModel.institute != null && profileModel.institute! > 0)
//         "institute": profileModel.institute,
//       // "semester":profileModel.semester,
//       if (profileModel.passingYear != null)
//         "passing_year": profileModel.passingYear,
//       if (profileModel.myCgpa!.isNotEmpty) "my_cgpa": profileModel.myCgpa,
//       // "institute_type": profileModel.instituteType,
//       if (profileModel.boardRoll != null) "board_roll": profileModel.boardRoll,
//       if (profileModel.guardianName!.isNotEmpty)
//         "guardian_name": profileModel.guardianName,
//       if (profileModel.guardianPhnNum!.isNotEmpty)
//         "guardian_phn_num": profileModel.guardianPhnNum,
//       if (profileModel.relationship!.isNotEmpty)
//         "relationship": profileModel.relationship,
//       // "class_name":
//       //     profileModel.instituteType == "other" ? profileModel.className : "",
//       if (profileModel.school!.isNotEmpty) "school": profileModel.school,
//       "session": profileModel.session,
//       "category": profileModel.category,
//     };
//     print("Body dataaaaaaaaaaaaaaaaaaaaaaaa ${bodyData}");
//
//     try {
//       Response response = await put(url, bodyData, headers: headerData);
//
//       if (response.statusCode == 200 && response.body['status'] == "success") {
//         ProfileModel model = ProfileModel.fromJson(response.body['data']);
//         return model;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       print('user get profile error : $error');
//     }
//   }
//
//   Future<UserModel?> userUpdate(UserModel userModel) async {
//     String url = AppUrl.putUserUpdateUrl + "${userModel.id}/";
//
//     try {
//       Response response =
//       await put(url, userModel.toJson(), headers: headerData);
//
//       if (response.statusCode == 200) {
//         UserModel model = UserModel.fromJson(response.body);
//         return model;
//       } else {
//         return null;
//       }
//     } catch (error) {
//       print('user get profile error : $error');
//     }
//   }
//
//   Future<List<LeaderBoardModel>> getQuizLeaderBoard() async {
//     String url = AppUrl.getQuizLeaderBoard;
//     try {
//       Response response = await get(url, headers: headerData);
//       print('${response.body}');
//
//       if (response.statusCode == 200) {
//         return leaderBoardModelFromJson(response.body["results"]);
//       } else {
//         return [];
//       }
//     } catch (error) {
//       print('user get profile error : $error');
//       return [];
//     }
//   }
//
//   Future<List<SessionModel>> getSession() async {
//     String url = AppUrl.getUserSession;
//     print(url);
//     try {
//       Response response = await get(url, headers: headerData);
//       print('${response.body}');
//
//       if (response.statusCode == 200) {
//         return sessionModelFromJson(response.body["data"]);
//       } else {
//         return [];
//       }
//     } catch (error) {
//       print('user get profile error : $error');
//       return [];
//     }
//   }
//
//   Future<String> postSharePoint({
//     required String receiverPhone,
//     required int point,
//   }) async {
//     try {
//       String postUrl = AppUrl.postSharePointUrl;
//       Map<String, dynamic> bodyJson = {
//         "receiver_phone": receiverPhone.trim(),
//         "amount": point,
//       };
//       print(postUrl);
//       print(bodyJson);
//
//       Response response = await post(postUrl, bodyJson, headers: headerData);
//       print('${response.body}');
//
//       print('${response.statusCode}');
//       if (response.statusCode == 200 && response.body['status'] == "Success") {
//         return " insert  Successfully";
//       } else {
//         return "";
//       }
//     } catch (exception) {
//       print('not insert point $exception');
//       return "";
//     }
//   }
//
//   Future<String?> profileImageUpdate(int userId, XFile imagePath) async {
//     String url = AppUrl.putUpdateProfileUrl + "2/";
//     print('$url');
//
//     // File file = File(imagePath.path);
//     // print(bodyData);
//     final xpath = imagePath.path;
//     final bytes = await File(xpath).readAsBytes();
//     List<int> dfafa = bytes;
//     try {
//       var bodyData = {"sex": "MALE", "profile_picture": null};
//       final form = FormData({
//         "sex": "MALE",
//         'profile_picture': MultipartFile(bytes, filename: imagePath.name),
//       });
//       print(form);
//       Response response = await put(url, form, headers: headerData);
//       print('${response.body}');
//       print('${response.statusCode}');
//
//       if (response.statusCode == 201 && response.body['status'] == "success") {
//         print(response.body);
//
//         // ProfileModel model = ProfileModel.fromJson(response.body['data']);
//         return "successfully update profile image";
//       } else {
//         return null;
//       }
//     } catch (error) {
//       print('user get profile error : $error');
//     }
//   }
//
//   Future<Response<ProfileModel>> postCases(List<int> image) {
//     final form = FormData({
//       "sex": "MALE",
//       'profile_picture': MultipartFile(image, filename: 'avatar2.png'),
//     });
//     return post(AppUrl.putUpdateProfileUrl + "2/", form);
//   }
}
