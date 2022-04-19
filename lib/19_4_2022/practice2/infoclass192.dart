import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo192 {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating; // Rating is a class

  UserInfo192({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory UserInfo192.fromJson(Map<String, dynamic> json) {
    return UserInfo192(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}

Future<List<UserInfo192>> fetchData() async {
  String URL = "https://fakestoreapi.com/products";
  final response = await http.get(Uri.parse(URL));
  List temp = jsonDecode(response.body);
  if (response.statusCode == 200) {
    List<UserInfo192> list = temp.map((e) => UserInfo192.fromJson(e)).toList();
    return list;
  } else {
    throw Exception("Failed to fetch Data");
  }
}

//https://fakestoreapi.com/products
