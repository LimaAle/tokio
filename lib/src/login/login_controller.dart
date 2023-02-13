import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tokiomarineapp/src/home/home.dart';

import '../model/user.dart';

class LoginController extends GetxController {
  final cpfController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final user = UserModel().obs;
  final isChecked = false.obs;
  @override
  void onInit() {
    loadUserEmailPassword();
    super.onInit();
  }

  void handleRememberMe(bool? value) {
    isChecked.value = value!;
    if (cpfController.value.text == "") return;
    if (passwordController.value.text == "") return;

    if (value) {
      SharedPreferences.getInstance().then(
        (prefs) {
          prefs.setBool("remember_me", isChecked.value);
          prefs.setString('email', cpfController.value.text);
          prefs.setString('password', passwordController.value.text);
        },
      );
    } else {
      clearRememberMe();
    }
  }

  void clearRememberMe() {
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", false);
        prefs.setString('email', "");
        prefs.setString('password', "");
      },
    );
  }

  void loadUserEmailPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString("email") ?? "";
    var password = prefs.getString("password") ?? "";
    var rememberMe = prefs.getBool("remember_me") ?? false;
    if (rememberMe) {
      cpfController.value.text = email;
      passwordController.value.text = password;
      isChecked.value = rememberMe;
    }
  }

  void login() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/users/1');
    final response = await http.get(url);
    user.value = UserModel.fromJson(jsonDecode(response.body));
    Get.off(const HomePage());
  }
}
