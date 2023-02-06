class WalletModel {
  WalletModel({
    this.availableBalance,
    this.transactionData,
  });

  WalletModel.fromJson(dynamic json) {
    availableBalance = json['available_balance'];
    if (json['transaction_data'] != null) {
      transactionData = [];
      json['transaction_data'].forEach((v) {
        transactionData?.add(TransactionData.fromJson(v));
      });
    }
  }
  num? availableBalance;
  List<TransactionData>? transactionData;
  WalletModel copyWith({
    num? availableBalance,
    List<TransactionData>? transactionData,
  }) =>
      WalletModel(
        availableBalance: availableBalance ?? this.availableBalance,
        transactionData: transactionData ?? this.transactionData,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['available_balance'] = availableBalance;
    if (transactionData != null) {
      map['transaction_data'] =
          transactionData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class TransactionData {
  TransactionData({
    this.id,
    this.user,
    this.userName,
    this.amount,
    this.comment,
  });

  TransactionData.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'];
    userName = json['user_name'];
    amount = json['amount'];
    comment = json['comment'];
  }
  num? id;
  num? user;
  String? userName;
  String? amount;
  String? comment;
  TransactionData copyWith({
    num? id,
    num? user,
    String? userName,
    String? amount,
    String? comment,
  }) =>
      TransactionData(
        id: id ?? this.id,
        user: user ?? this.user,
        userName: userName ?? this.userName,
        amount: amount ?? this.amount,
        comment: comment ?? this.comment,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user'] = user;
    map['user_name'] = userName;
    map['amount'] = amount;
    map['comment'] = comment;
    return map;
  }
}
