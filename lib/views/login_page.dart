// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coinsense/controllers/user_controller.dart';
import 'package:coinsense/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the column vertically
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Coin Sense",
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.black,
                          fontSize: 40,
                        ),
                      ),
                      TextSpan(text: "\n"),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: "Smart Money, Simplified",
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    labelStyle: GoogleFonts.spaceGrotesk(fontSize: 20),
                    hintText: "john@example.com",
                    hintStyle: GoogleFonts.spaceGrotesk(),
                    suffixIcon: Icon(Icons.mail_outline_rounded),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    labelStyle: GoogleFonts.spaceGrotesk(fontSize: 20),
                    hintText: "6 Characters Long",
                    hintStyle: GoogleFonts.spaceGrotesk(),
                    suffixIcon: Icon(Icons.lock_outline_rounded),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft, // or Alignment.centerRight
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: Colors.black,
                      child: Text(
                        'Login',
                        style: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        // Button press logic
                        UserController().loginUser(_emailController.text,
                            _passwordController.text, context);
                        // .whenComplete(() => Navigator.push(
                        //     context,
                        //     CupertinoPageRoute(
                        //         builder: (context) => HomePage())));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
