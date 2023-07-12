import 'package:coinsense/views/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController with ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  Future<void> checkAuthentication() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? authKey = prefs.getString('auth_key');

    if (authKey != null && !JwtDecoder.isExpired(authKey)) {
      _isAuthenticated = true;
    } else {
      _isAuthenticated = false;
    }

    notifyListeners();
  }

  Future<void> registerUser() async {
    // Register logic implementation
    _isAuthenticated =
        true; // Set isAuthenticated to true upon successful registration
    notifyListeners();
  }

  Future<void> loginUser(String email, String password, context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String path = "http://192.168.1.137:3000/auth/login";
    var response =
        await Dio().post(path, data: {"email": email, "password": password});
    if (response.statusCode == 200) {
      final String authKey = response.data;
      await prefs.setString('auth_key', authKey);
      _isAuthenticated =
          true; // Set isAuthenticated to true upon successful login
      Navigator.push(
          context, CupertinoPageRoute(builder: (context) => HomePage()));
      notifyListeners();
    }
  }
}
