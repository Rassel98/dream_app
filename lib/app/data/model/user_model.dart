class UserModel {
  UserModel({
    this.id,
    this.username,
    this.email,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }
  num? id;
  String? username;
  String? email;
  UserModel copyWith({
    num? id,
    String? username,
    String? email,
  }) =>
      UserModel(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    return map;
  }
}
