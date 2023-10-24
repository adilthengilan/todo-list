import 'package:design/ListView.dart';
import 'package:design/providerrr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'LoginPage.dart';
import 'SignupPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  LoginPageState login = LoginPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 300, left: 10),
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 40,
                      width: 40,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          icon: Icon(Icons.arrow_back_ios_new)))
                ],
              ),
            ),
            height: 400,
            width: 400,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 5, 12, 90),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/user_pic-removebg-preview.png'),
                    fit: BoxFit.fill)),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: 130,
                  child: Text(
                    username[0],
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                margin: EdgeInsets.only(top: 8, left: 30),
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                height: 50,
                width: MediaQuery.of(context).size.width / 2.2,
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 50,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 0),
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 30),
                    Text(
                      '   Settings',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width / 1.06,
            ),
          ),
          GestureDetector(
            onTap: () {
              UserDetails(context);
            },
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 50,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 0),
                child: Row(
                  children: [
                    Icon(Icons.account_box, size: 30),
                    Text(
                      '   User Details',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width / 1.06,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) =>
                    false, // This ensures all previous routes are removed
              );
              Provider.of<LoginProvider>(context).removeLogin();
            },
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 50,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 0),
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 30),
                    Text(
                      '   Logout',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 248, 248, 248),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: MediaQuery.of(context).size.height / 14,
              width: MediaQuery.of(context).size.width / 1.06,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 50,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 0),
              child: Row(
                children: [
                  Icon(Icons.delete, size: 30),
                  Text(
                    '   Delete Account',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 248, 248),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width / 1.06,
          ),
        ],
      ),
    );
  }
}

Future<dynamic> UserDetails(
  BuildContext context,
) async =>
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            title: Text(
              '          User Details',
            ),
            content: Text(
                "Users Name : ${username[0]}\nPhone Number: ${PhoneNumber[0]}"),
          );
        });
