import 'dart:async';

import 'package:design/HomePage.dart';
import 'package:design/LoginPage.dart';
import 'package:design/providerrr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//splashscreen
class _SplashScreenState extends State<SplashScreen> {
  LoginPageState obj = LoginPageState();
  @override
  void initState() {
    super.initState();
    obj.loadLogin();
    print(username);
    Timer(Duration(seconds: 5), () {
      if (username.isEmpty || password.isEmpty) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<SignUp>(context).Get_SignupDetails();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 20, 4, 136),
            Color.fromARGB(255, 57, 2, 48)
          ])),
      child: Image.asset("assets/images/todo-app-icon.png"),
    );
  }
}
