import 'package:get_data/app/service/domain/user.dart';

class Data {
  String? token;
  String? email;
  User? user;

  Data({this.email, this.token, this.user});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      email: json['email'],
      user: User.fromJson(json['user']),
    );
  }
}
