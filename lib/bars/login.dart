import 'dart:convert';
import 'dart:js';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import '../main.dart';
import '../pages/auth.dart';
class LoginPage extends StatelessWidget {
  LoginPage(PageController pageController, Account account, {Key? key}) : super(key: key);
  String _PASSWORD = "";
  String _EMAIL = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 500,vertical: 250),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:30),
                    child: const Text("RightPrice"),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextField(
                        onChanged: (String val) {
                          _EMAIL = val;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                        ),
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Пароль',
                      ),
                      onChanged: (String val) {
                        _PASSWORD = val;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 110),
                    child: Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.black87,
                                  minimumSize: const Size(88, 36),
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  )),
                              onPressed: (){
                                AuthPage.controller
                                    .nextPage(
                                    duration: Duration(milliseconds: 1000),
                                    curve: Curves.easeIn);
                              },
                              child: const Text("Register")
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.black87,
                                  minimumSize: const Size(88, 36),
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                  )),
                              onPressed: () async {
                                final user = await account.createEmailSession(
                                    email: _EMAIL,
                                    password: sha256.convert(utf8.encode(_PASSWORD))
                                        .toString()
                                );
                                if (user != null) {
                                  Navigator.pushNamedAndRemoveUntil(context, "/mainpage", (route) => false);
                                }
                              },
                              child: const Text("Log in")
                          )
                        ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}



