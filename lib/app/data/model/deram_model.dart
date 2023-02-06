// To parse this JSON data, do
//
//     final dreamModel = dreamModelFromJson(jsonString);

import 'dart:convert';

// List<CategoryModel> categoryModelFromJson(dynamic str) =>
//     List<CategoryModel>.from(
//         (str as List<dynamic>).map((x) => CategoryModel.fromJson(x)));
//
// String categoryModelToJson(List<CategoryModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<DreamModel> dreamModelFromJson(dynamic str) =>
    List<DreamModel>.from((str as List<dynamic>).map((x) => DreamModel.fromJson(x)));

// class DreamModel {
//   DreamModel({
//     this.id,
//     this.user,
//     this.amount,
//     this.description,
//     this.dreamName,
//     this.comment,
//     this.percentage,
//     this.accountBalance,
//     this.photo,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   int? user;
//   String? amount;
//   String? description;
//   String? dreamName;
//   String? comment;
//   int? percentage;
//   int? accountBalance;
//   String ?photo;
//   String? createdAt;
//   String? updatedAt;
//
//   factory DreamModel.fromJson(Map<String, dynamic> json) => DreamModel(
//     id: json["id"],
//     user: json["user"],
//     amount: json["amount"],
//     description: json["description"],
//     dreamName: json["dream_name"],
//     comment: json["comment"],
//     percentage: json["percentage"],
//     accountBalance: json["account_balance"],
//     photo: json["photo"],
//     createdAt: json["created_at"],
//     updatedAt: json["updated_at"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "user": user,
//     "amount": amount,
//     "description": description,
//     "dream_name": dreamName,
//     "comment": comment,
//     "percentage": percentage,
//     "account_balance": accountBalance,
//     "photo": photo,
//   };
// }



class DreamModel {
  DreamModel({
    this.id,
    this.user,
    this.userName,
    this.amount,
    this.description,
    this.dreamName,
    this.comment,
    this.like,
    this.percentage,
    this.accountBalance,
    this.photo,
    this.createdAt,
    this.updatedAt,
  });

  int?  id;
  int ? user;
  String? userName;
  String ?amount;
  String? description;
  String? dreamName;
  dynamic comment;
  int ?like;
  int ?percentage;
  int ?accountBalance;
  String? photo;
  String ?createdAt;
  String? updatedAt;

  factory DreamModel.fromJson(Map<String, dynamic> json) => DreamModel(
    id: json["id"],
    user: json["user"],
    userName: json["user_name"],
    amount: json["amount"],
    description: json["description"],
    dreamName: json["dream_name"],
    comment: json["comment"],
    like: json["like"],
    percentage: json["percentage"],
    accountBalance: json["account_balance"],
    photo: json["photo"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );


}

