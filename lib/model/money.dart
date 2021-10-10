import 'package:uuid/uuid.dart';

class Money {
  //Id
  String? id;

//商品名
  String? title;

//前の額（高い額）
  int? beforeMoney;

//後の額（安い額）
  int? afterMoney;

  Money({
    this.id,
    this.title,
    this.beforeMoney,
    this.afterMoney,
  });

  Money.newMoney() {
    title = '';
    beforeMoney = 0;
    afterMoney = 0;
  }

  assignUUID() {
    id = const Uuid().v4();
  }

  factory Money.formMap(Map<String, dynamic> json) => Money(
        id: json["id"],
        title: json["title"],
        beforeMoney: json["beforeMoney"],
        afterMoney: json["afterMoney"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "beforeMoney": beforeMoney,
        "afterMoney": afterMoney,
      };
}
