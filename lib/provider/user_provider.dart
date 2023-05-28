import 'package:amozon_clone/model/user.dart';
import 'package:flutter/material.dart';

// like redux toolkit
class UserProvider extends ChangeNotifier {
  User _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      role: '',
      token: '');

  User get user => _user;

// 17 in copy
  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }
}
