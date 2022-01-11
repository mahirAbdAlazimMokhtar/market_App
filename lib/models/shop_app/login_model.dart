// ignore_for_file: unnecessary_null_in_if_null_operators

class ShopLoginModel {
  bool? status;
  String? message;
  UserData? data;

  ShopLoginModel.fromJason(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    //لو البيانات الراجع غير خالية رجع لي بيانات الداتا ولو العكس خليها  فاضية
    data = json['data'] != null ? UserData.fromJason(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? image;
  String? phone;
  String? token;
  int? points;
  int? credit;
  // UserData({
  //   this.id,
  //   this.name,
  //   this.email,
  //   this.credit,
  //   this.image,
  //   this.phone,
  //   this.points,
  //   this.token,
  // });
  //named constructor
  UserData.fromJason(Map<String, dynamic> json) {
    // the data come as list of map
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    token = json['token'];
    points = json['points'];
    credit = json['credit'];
  }
}
