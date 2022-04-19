import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo191 {
  String id;
  String created_at;
  String updated_at;
  int width;
  int height;
  String color;
  int likes;
  int views;
  int downloads;

  User user; // User is a class
  Urls urls; // Urls is a class
  Links links; // Links is a class
  Location location; // Location is class
  Exif exif; // Exif is a class

  UserInfo191({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.width,
    required this.height,
    required this.color,
    required this.likes,
    required this.views,
    required this.downloads,
    required this.user, // instance of class
    required this.urls, // instance of class
    required this.links, // instance of class
    required this.location, // instance of class
    required this.exif, // instance of class
  });

  factory UserInfo191.fromJson(Map<String, dynamic> json) {
    return UserInfo191(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      likes: json['likes'],
      views: json['views'],
      downloads: json['downloads'],
      user: User.fromJson(json['user']),
      urls: Urls.fromJson(json['urls']),
      links: Links.fromJson(json['links']),
      location: Location.fromJson(json['location']),
      exif: Exif.fromJson(json['exif']),
    );
  }
}

class User {
  String id;
  String updated_at;
  String username;
  String name;
  String first_name;
  String last_name;
  String twitter_username;
  String portfolio_url;
  String bio;
  String location;
  int total_collections;
  String instagram_username;
  int total_likes;
  int total_photos;

  Link links; // Link is class
  ProfileImage profile_image; // ProfileImage is class

  User({
    required this.id,
    required this.updated_at,
    required this.username,
    required this.name,
    required this.first_name,
    required this.last_name,
    required this.twitter_username,
    required this.portfolio_url,
    required this.bio,
    required this.location,
    required this.total_collections,
    required this.instagram_username,
    required this.total_likes,
    required this.total_photos,
    required this.links,
    required this.profile_image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      updated_at: json['updated_at'],
      username: json['username'],
      name: json['name'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      twitter_username: json['twitter_username'],
      portfolio_url: json['portfolio_url'],
      bio: json['bio'],
      location: json['location'],
      total_collections: json['total_collections'],
      instagram_username: json['instagram_username'],
      total_likes: json['total_likes'],
      total_photos: json['total_photos'],
      links: Link.fromJson(json['links']),
      profile_image: ProfileImage.fromJson(json['profile_image']),
    );
  }
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }
}

class Links {
  String self;
  String html;
  String download;
  String download_location;

  Links({
    required this.self,
    required this.html,
    required this.download,
    required this.download_location,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'],
      html: json['html'],
      download: json['download'],
      download_location: json['download_location'],
    );
  }
}

class Location {
  String name;
  String city;
  String country;
  Map<String, dynamic> position;

  Location({
    required this.name,
    required this.city,
    required this.country,
    required this.position,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      city: json['city'],
      country: json['country'],
      position: json['position'],
    );
  }
}

class Exif {
  String make;
  String model;
  String exposure_time;
  String aperture;
  String focal_length;
  int iso;

  Exif({
    required this.make,
    required this.model,
    required this.exposure_time,
    required this.aperture,
    required this.focal_length,
    required this.iso,
  });

  factory Exif.fromJson(Map<String, dynamic> json) {
    return Exif(
      make: json['make'],
      model: json['model'],
      exposure_time: json['exposure_time'],
      aperture: json['aperture'],
      focal_length: json['focal_length'],
      iso: json['iso'],
    );
  }
}

class Link {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  Link({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      self: json['self'],
      html: json['html'],
      photos: json['photos'],
      likes: json['likes'],
      portfolio: json['portfolio'],
      following: json['following'],
      followers: json['followers'],
    );
  }
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      small: json['small'],
      medium: json['medium'],
      large: json['large'],
    );
  }
}

Future<UserInfo191> fetchData() async {
  String URL = "https://jsonkeeper.com/b/RM1E";
  final response = await http.get(Uri.parse(URL));
  var temp = jsonDecode(response.body);
  if (response.statusCode == 200) {
    UserInfo191 userInstance = UserInfo191.fromJson(temp);
    return userInstance;
  } else {
    throw Exception("Failed to fetch data");
  }
}

// https://jsonkeeper.com/b/RM1E
