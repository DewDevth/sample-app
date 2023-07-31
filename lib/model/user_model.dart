import 'dart:convert';

class User {
  int id;
  String? fname;
  String? lname;
  String? username;
  String? email;
  String? avatar;

  User({
    required this.id,
    this.fname,
    this.lname,
    this.username,
    this.email,
    this.avatar,
  });

  // Additional constructor if you want to initialize from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fname: json['fname'],
      lname: json['lname'],
      username: json['username'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
