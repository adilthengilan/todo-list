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
  State<ProfilePage> createState() => ProfilePageState();
}

var Delete;

class ProfilePageState extends State<ProfilePage> {
  LoginPageState login = LoginPageState();

  @override
  Widget build(BuildContext context) {
    findPhone();
    DeleteAccountindex();
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 40, left: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 31, 8, 93),
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
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 40),
                  child: Text(
                    'Profile',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/user pic.jpeg',
                        ),
                        fit: BoxFit.fill),
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              // width: double.infinity,
              child: Text(
                username[0],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 30,
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
                      Icon(Icons.edit_document, size: 30),
                      Text(
                        '   Edit Profile',
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
                Provider.of<LoginProvider>(context, listen: false)
                    .removeLogin(0);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) =>
                      false, // This ensures all previous routes are removed
                );
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
            GestureDetector(
              onTap: () {
                DeleteAccount(context);
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }

  String Phone = '';

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
              content:
                  Text("Users Name : ${username[0]}\nPhone Number: ${Phone}"),
            );
          });

  void findPhone() {
    int i;

    for (i = 0; i < SignupUsernames.length; i++) {
      if (username[0] == SignupUsernames[i]) {
        Phone = PhoneNumber[i];
      }
    }
  }

  void DeleteAccountindex() {
    int i;
    for (i = 0; i < SignupUsernames.length; i++) {
      if (username[0] == SignupUsernames[i]) {
        Delete = i;
      }
    }
  }

  Future<dynamic> DeleteAccount(
    BuildContext context,
  ) async =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Consumer<SignUp>(builder: (context, value, child) {
              return AlertDialog(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                title: Text(
                  'Are you sure want to Delete your Account..?',
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('No')),
                  TextButton(
                      onPressed: () {
                        Provider.of<LoginProvider>(context, listen: false)
                            .removeLogin(0);
                        Navigator.of(
                          context,
                        ).pop();
                        value.DeleteDetails();

                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) =>
                              false, // This ensures all previous routes are removed
                        );
                      },
                      child: Text('Yes'))
                ],
              );
            });
          });
}
