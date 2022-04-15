import 'package:http/http.dart' as http;
import 'dart:convert';

class InfoAPI {
  int UserId;
  int id;
  String title;
  String body;

  InfoAPI({
    required this.UserId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory InfoAPI.fromJson(Map<String, dynamic> json) {
    return InfoAPI(
      UserId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

Future<List<InfoAPI>> fetchData() async {
  String URL = "https://jsonplaceholder.typicode.com/posts";
  final response = await http.get(Uri.parse(URL));
  if (response.statusCode == 200) {
    List temp = jsonDecode(response.body);

    List<InfoAPI> list = temp.map((e) => InfoAPI.fromJson(e)).toList();
    return list;
  } else {
    throw Exception("Failed to load data");
  }
}
