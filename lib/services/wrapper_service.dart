import 'package:coinsense/controllers/user_controller.dart';
import 'package:coinsense/views/home_page.dart';
import 'package:coinsense/views/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthControllerWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<UserController>(context);
    authController
        .isAuthenticated; // Check authentication status on app startup

    return authController.isAuthenticated
        ? const HomePage()
        : const LoginPage();
  }
}
