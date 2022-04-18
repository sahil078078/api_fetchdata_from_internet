import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo181 {
  int id;
  String name;
  String username;
  String email;
  String phone;
  String website;
  Address address;
  Company company;

  UserInfo181({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory UserInfo181.fromJson(Map<String, dynamic> json) {
    return UserInfo181(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
}

class Geo {
  String lat;
  String lng;

  Geo({
    required this.lat,
    required this.lng,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> jn) {
    return Company(
      name: jn['name'],
      catchPhrase: jn['catchPhrase'],
      bs: jn['bs'],
    );
  }
}

Future<List<UserInfo181>> fetchData() async {
  String URL = 'https://jsonplaceholder.typicode.com/users';
  final response = await http.get(Uri.parse(URL));
  List temp = jsonDecode(response.body);
  print(response.runtimeType);
  print(response.statusCode);
  if (response.statusCode == 200) {
    List<UserInfo181> list = temp.map((e) => UserInfo181.fromJson(e)).toList();
    print(list.runtimeType);
    return list;
  } else {
    throw Exception("Failed To fetch Data");
  }
}
