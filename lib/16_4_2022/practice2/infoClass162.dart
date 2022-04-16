import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo162 {
  String? name;
  String? exp;
  String? worktech;
  String? image;
  String? contact;
  String? lang;
  String? framwork;
  String? wotktime;

  UserInfo162(
      {this.name,
      this.exp,
      this.worktech,
      this.image,
      this.contact,
      this.lang,
      this.framwork,
      this.wotktime});

  factory UserInfo162.fromJson(Map<String, dynamic> json) {
    return UserInfo162(
      name: json['name'],
      exp: json['exp'],
      worktech: json['worktech'],
      image: json['image'],
      contact: json['contact'],
      lang: json['lang'],
      framwork: json['framwork'],
      wotktime: json['wotktime'],
    );
  }
}

Future<UserInfo162> fetchData() async {
  String URL = 'https://jsonkeeper.com/b/O5KR';
  var responce = await http.get(Uri.parse(URL));
  var temp = UserInfo162.fromJson(jsonDecode(responce.body));
  print(temp);
  // print(temp.runtimeType);
  return UserInfo162.fromJson(jsonDecode(responce.body));
}
