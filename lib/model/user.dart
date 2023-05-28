// ignore_for_file: public_member_api_docs, sort_constructors_first
// made asa a schema and for userProvider page yo use Provider package
// which i state management(data transfer betwn pages)  tool
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String role;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.role,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'address': address});
    result.addAll({'role': role});
    result.addAll({'token': token});

    return result;
  }

  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   result.addAll({'id': id});
  //   result.addAll({'name': name});
  //   result.addAll({'email': email});
  //   result.addAll({'password': password});
  //   result.addAll({'address': address});
  //   result.addAll({'type': type});
  //   result.addAll({'token': token});

  //   return result;
  // }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      role: map['role'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
