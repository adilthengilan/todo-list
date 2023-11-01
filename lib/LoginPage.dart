import 'package:design/HomePage.dart';
import 'package:design/providerrr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => LoginPageState();
}

List<String> username = [];
List<String> password = [];
List<String> PhnNumber = [];

class LoginPageState extends State<LoginPage> {
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController UserNameController = TextEditingController();

  bool showError = false;

  // bool pressed = true;
  // bool press = true;
  bool hiden = true;
  @override
  Widget build(BuildContext context) {
    Provider.of<SignUp>(context).Get_SignupDetails();
    Provider.of<LoginProvider>(context).loadLogin();

    // Provider.of<LoginProvider>(context);
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
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: SizedBox(
                      height: 250,
                      width: 250,
                      child: Image.asset('assets/images/todo-app-icon.png')),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.10,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: UserNameController,
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
                      hintText: 'UserName',
                      hoverColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.only(left: 50),
                    ),
                  ),
                ),
                Consumer<ProviderSetting>(builder: (context, data, child) {
                  return Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width / 1.10,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: PasswordController,
                      obscureText: data.isHiden,
                      onSaved: (input) => UserNameController.text = input!,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return 'jjjj';
                        }
                        return null;
                      },
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
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.only(left: 50)),
                    ),
                  );
                }),
                Visibility(
                    visible: showError,
                    child: Text(
                      'Check your username or password!..',
                      style: TextStyle(color: Colors.red),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width / 1.10,
                  height: 50,
                  margin: EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: () {
                      if (UserNameController.text.isEmpty ||
                          PasswordController.text.isEmpty) {
                        setState(() {
                          showError = true;
                        });
                      } else {
                        setState(() {
                          showError = false;
                        });
                      }
                      Validation();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 1, 23, 143),
                        )),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 80),
                      child: Text(
                        'Dont have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage(),
                          ));
                        },
                        child: Text(
                          'SignUp',
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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 120, top: 10),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/7611770-removebg-preview.png'))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Gmail-logo-removebg-preview.png'))),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/download__2_-removebg-preview (1).png'),
                              fit: BoxFit.fill)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void AddLoginInfo(String use, String pass) async {
  //   username.add(use);
  //   password.add(pass);
  //   saveLogin();
  // }

  // Future<void> saveLogin() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList('logins', username);
  //   prefs.setStringList('passwords', password);
  // }

  // removeLogin() {
  //   username.removeAt(0);
  //   password.removeAt(0);
  //   saveLogin();
  // }

  void Validation() async {
    for (int i = 0; i < SignupUsernames.length; i++) {
      if (UserNameController.text == SignupUsernames[i] &&
          PasswordController.text == SignupPasswords[i]) {
        Provider.of<LoginProvider>(context, listen: false)
            .AddLoginInfo(UserNameController.text, PasswordController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        setState(() {
          showError = false;
        });
        print('hhhhhhhhhhhhhhhhhh');
      }
    }
  }
}



// Future<void> loadLogin() async {
//   final prefs = await SharedPreferences.getInstance();
//   username = prefs.getStringList('logins') ?? [];
//   password = prefs.getStringList('passwords') ?? [];

//   print(username);
//   print(password);
// }

///////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////
//////////////////////////////////////
//////////////////////////////////////////////
///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
