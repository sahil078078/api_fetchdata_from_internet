import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo162 {
  int userId;
  String name;
  int exp;
  String worktech;
  String image;
  int contact;
  String lang;
  String framwork;
  String wotktime;

  UserInfo162(
      {required this.userId,
      required this.name,
      required this.exp,
      required this.worktech,
      required this.image,
      required this.contact,
      required this.lang,
      required this.framwork,
      required this.wotktime});

  factory UserInfo162.fromJson(Map<String, dynamic> json) {
    return UserInfo162(
      userId: json['userID'],
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

Future<List<UserInfo162>> fetchData() async {
  String URL = 'https://jsonkeeper.com/b/O5KR';
  final responce = await http.get(Uri.parse(URL));
  List temp = jsonDecode(responce.body);
  if (responce.statusCode == 200) {
    List<UserInfo162> list = temp.map((e) => UserInfo162.fromJson(e)).toList();
    return list;
  } else {
    throw Exception('Failed to Fetch Data');
  }
}
