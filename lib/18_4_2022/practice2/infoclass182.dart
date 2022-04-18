import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo182 {
  String msg;
  List<Data> data;

  UserInfo182({
    required this.msg,
    required this.data,
  });

  factory UserInfo182.fromJson(Map<String, dynamic> json) {
    return UserInfo182(
      msg: json['msg'],
      data: List<Data>.from(json['data'].map((x) => Data.fromJson(x))),
    );
  }
}

class Data {
  int id;
  String name;
  String mobile_number;
  String email;
  String? date_of_birth;
  String? gender;
  String? house_no;
  String? street_address;
  String? city;
  String? state;
  String? pincode;
  String? profile_image;
  bool? is_active;
  String? createAt;

  Data({
    required this.id,
    required this.name,
    required this.mobile_number,
    required this.email,
    required this.date_of_birth,
    required this.gender,
    required this.house_no,
    required this.street_address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.profile_image,
    required this.is_active,
    required this.createAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        name: json['name'],
        mobile_number: json['mobile_number'],
        email: json['email'],
        date_of_birth: json['date_of_birth'],
        gender: json['gender'],
        house_no: json['house_no'],
        street_address: json['street_address'],
        city: json['city'],
        state: json['state'],
        pincode: json['pincode'],
        profile_image: json['profile_image'],
        is_active: json['is_active'],
        createAt: json['createAt']);
  }
}

Future<UserInfo182> fetchData() async {
  String url = 'https://jsonkeeper.com/b/2S6J';
  final response = await http.get(Uri.parse(url));
  final temp = jsonDecode(response.body);
  print(temp.runtimeType);
  print(response.statusCode);
  if (response.statusCode == 200) {
    UserInfo182 userInstance = UserInfo182.fromJson(temp);
    print(userInstance);
    print(userInstance.runtimeType);
    return userInstance;
  } else {
    throw Exception('Failed TO fetch Data');
  }
}
