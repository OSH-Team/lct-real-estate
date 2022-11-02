import 'dart:convert';
import 'dart:js';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:sizer/sizer.dart';
import '../main.dart';
import '../pages/auth.dart';
class LoginPage extends StatelessWidget {
  LoginPage(PageController pageController, Account account, {Key? key}) : super(key: key);
  String _PASSWORD = "";
  String _EMAIL = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 55.0.w, vertical: 18.0.h),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 0.1.h),
              child: Column(
                children: [
                  Container(
                      height: 2.0.h,
                      width: 25.0.w,
                      margin: EdgeInsets.only(top: 2.0.h),
                      child: Image.asset('logo.png')
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2.0.h),
                    child: TextField(
                      onChanged: (String val) {
                        _EMAIL = val;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2.0.h),
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
                    margin: EdgeInsets.only(top: 1.0.h, left: 14.9.w, right: 14.9.w),
                    child: Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  primary: Colors.black87,
                                  minimumSize: const Size(20, 30),
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
                                  backgroundColor: Color(0xACACAC),
                                  minimumSize: const Size(20, 30),
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



