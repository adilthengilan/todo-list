import 'package:design/providerrr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LoginPage.dart';

List<String> PhoneNumber = [];

class SignUpPage extends StatefulWidget {
  SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController NameController = TextEditingController();
  final TextEditingController PhoneNumberController = TextEditingController();
  final TextEditingController SignupPasswordController =
      TextEditingController();
  final TextEditingController ConfirmPasswordController =
      TextEditingController();
  bool hiden = true;
  // bool pressed = true;
  // bool press = true;

  @override
  Widget build(BuildContext context) {
    Provider.of<SignUp>(context).Get_SignupDetails();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 2, 22, 135),
              Color.fromARGB(255, 64, 3, 40)
            ])),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.9,
                  child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset('assets/images/todo-app-icon.png')),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.10,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: NameController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'Enter UserName',
                      hoverColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.only(left: 50),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 1.10,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: PhoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.call,
                          color: Colors.white,
                        ),
                      ),
                      hintText: 'Enter PhoneNumber',
                      hoverColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.only(left: 50),
                    ),
                  ),
                ),
                Consumer<ProviderSetting>(builder: (context, data, child) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 1.10,
                    child: TextField(
                      controller: SignupPasswordController,
                      style: TextStyle(color: Colors.white),
                      obscureText: data.isHiden,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                data.passwordview();
                              },
                              child: Icon(
                                data.isHiden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              )),
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.only(left: 50)),
                    ),
                  );
                }),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 1.10,
                  child: TextField(
                    controller: ConfirmPasswordController,
                    style: TextStyle(color: Colors.white),
                    obscureText: hiden,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                hiden = !hiden;
                              });
                            },
                            child: Icon(
                              hiden ? Icons.visibility : Icons.visibility_off,
                              color: Colors.white,
                            )),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.only(left: 50)),
                  ),
                ),
                Consumer<SignUp>(builder: (context, add, child) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.10,
                    height: 50,
                    margin: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (NameController.text.isNotEmpty &&
                            ConfirmPasswordController.text.isNotEmpty) {
                          if (PhoneNumberController.text.isNotEmpty &&
                              SignupPasswordController.text.isNotEmpty) {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                            add.AddSignupDetails(
                                NameController.text,
                                ConfirmPasswordController.text,
                                PhoneNumberController.text);
                          }
                        }
                      },
                      child: Text(
                        'SignUp',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 1, 23, 143),
                          )),
                    ),
                  );
                }),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 110),
                      child: Text(
                        'Have an account?',
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Color.fromARGB(255, 84, 61, 255),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //       top: MediaQuery.of(context).size.height / 30,
                    //       left: MediaQuery.of(context).size.width / 1.6),
                    //   child: GestureDetector(
                    //     onTap: () {},
                    //     child: Text(
                    //       'Help',
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           decoration: TextDecoration.underline),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
