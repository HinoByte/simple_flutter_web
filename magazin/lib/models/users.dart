import 'package:flutter/foundation.dart';

class Users {
  Users({
    this.idUser,
    @required this.login,
    @required this.email,
    @required this.password,
    this.isAdmin,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      idUser: json['idUser'] as int,
      login: json['login'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      isAdmin: json['isAdmin'] as int,
    );
  }

  int idUser;
  String login;
  String email;
  String password;
  int isAdmin;

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "login": login,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
      };
}
