import 'dart:async';
import 'package:design/LoginPage.dart';
import 'package:design/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignupPage.dart';

class ProviderSetting extends ChangeNotifier {
  final taskname = TextEditingController();
  List<String> tasks = [];

  ProviderSetting() {
    loadTask();
    notifyListeners();
  }
  bool isHiden = true;

  void passwordview() {
    isHiden = !isHiden;
    notifyListeners();
  }

  void addTask(String task) async {
    tasks.add(task);
    saveTasks();
    taskname.clear();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks);
  }

  void loadTask() async {
    final prefs = await SharedPreferences.getInstance();
    tasks = prefs.getStringList('tasks') ?? [];
    if (tasks.isNotEmpty) {}
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    saveTasks();
    notifyListeners();
  }
}

class LoginProvider with ChangeNotifier {
  LoginPageState login = LoginPageState();
  void AddLoginInfo(String use, String pass) async {
    username.add(use);
    password.add(pass);
    saveLogin();
    login.UserNameController.clear();
  }

  Future<void> saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('logins', username);
    prefs.setStringList('passwords', password);
  }

  void removeLogin(int index) {
    username.removeAt(index);
    password.removeAt(index);
    saveLogin();
    notifyListeners();
  }

  Future<void> loadLogin() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getStringList('logins') ?? [];
    password = prefs.getStringList('passwords') ?? [];

    print(username);
    print(password);
  }
}

class SignUp extends ChangeNotifier {
  ProfilePageState profile = ProfilePageState();
  SignUp() {
    Get_SignupDetails();
    notifyListeners();
  }

  Future<void> Save_SignupDetails() async {
    SharedPreferences object = await SharedPreferences.getInstance();
    object.setStringList('SignUpUserNames', SignupUsernames);
    object.setStringList('SignUpPasswords', SignupPasswords);
    object.setStringList('PhoneNumber', PhoneNumber);
  }

  Future<void> Get_SignupDetails() async {
    SharedPreferences object = await SharedPreferences.getInstance();
    SignupUsernames = object.getStringList('SignUpUserNames') ?? [];
    SignupPasswords = object.getStringList('SignUpPasswords') ?? [];
    PhoneNumber = object.getStringList('PhoneNumber') ?? [];
    print(SignupUsernames);
    print(SignupPasswords);
    print(PhoneNumber);
  }

  void AddSignupDetails(String name, String Pss, String Phone) {
    SignupUsernames.add(name);
    SignupPasswords.add(Pss);
    PhoneNumber.add(Phone);

    Save_SignupDetails();
  }

  void DeleteDetails() {
    SignupUsernames.removeAt(Delete);
    SignupPasswords.removeAt(Delete);
    PhoneNumber.removeAt(Delete);
    Save_SignupDetails();
    notifyListeners();
  }
}

class ButtonChanging with ChangeNotifier {
  bool Button = true;

  void Butn() {
    Button = !Button;
    notifyListeners();
  }
}
