import 'dart:convert';

import 'package:amozon_clone/common/bottom_bar.dart';
import 'package:amozon_clone/constant/const.dart';
import 'package:amozon_clone/constant/error_hamdling.dart';
import 'package:amozon_clone/constant/uti.dart';
import 'package:amozon_clone/model/user.dart';
import 'package:amozon_clone/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // sigup user
  void signUpUser({
    required String email,
    required BuildContext context,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        role: '',
        token: '',
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(), // making json
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Created Account');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e);
    }
  }

// sigin user
  void signInUser({
    required String email,
    required BuildContext context,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // like putting data in local storage
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            // sends data to userProvider page and keeps the data there using setUser function like redux
            await prefs.setString('x-auth-token',
                jsonDecode(res.body)['token']); // saving token in local storage
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // getting user data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          });
      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
            // here token! isnt nedde beacuse we have already told token cant be null at 94
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
        // get user data
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
