import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:osh_main_build/bars/login.dart';
import 'package:osh_main_build/bars/register.dart';
import 'package:osh_main_build/main.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
class AuthPage extends StatelessWidget {
  AuthPage(Account account, {Key? key}) : super(key: key);
  static PageController controller = PageController(
    initialPage: 0,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            children: [LoginPage(controller),RegisterPage(controller)],
          ),
        )
      ),
    );
  }
}




