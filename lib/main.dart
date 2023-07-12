// ignore_for_file: prefer_const_constructors

import 'package:coinsense/controllers/expense_controller.dart';
import 'package:coinsense/controllers/user_controller.dart';
import 'package:coinsense/services/wrapper_service.dart';
import 'package:coinsense/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ExpenseController()),
      ChangeNotifierProvider(create: (_) => UserController())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: AuthControllerWrapper());
  }
}
