import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo {
  String? name;
  int? exp;
  String? worktech;
  String? image;
  String? contact;

  UserInfo({
    this.name,
    this.exp,
    this.worktech,
    this.image,
    this.contact,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      name: json['name'],
      exp: json['exp'],
      worktech: json['worktech'],
      image: json['image'],
      contact: json['contact'],
    );
  }
}

Future<List> fetchData() async {
  var response = await http.get(Uri.parse('https://jsonkeeper.com/b/TD1R'));
  // print(response);
  // print(response.body);
  var list = jsonDecode(response.body);
  print(list.runtimeType);
  print(list);
  if (response.statusCode == 200) {
    return (jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}
