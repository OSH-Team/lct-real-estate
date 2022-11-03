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
    return Center(
      child: Container(
          height: 395,
          width: 629,
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
                        decoration: BoxDecoration(
                          border: Border.all()
                        ),
                        height: 61,
                        width: 256,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 2.0.h),
                        child: Image.asset('logo.png')
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.0.h),
                      child: TextField(
                        onChanged: (String val) {
                          _EMAIL = val;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: const TextStyle(
                          ),
                          fillColor: const Color(0xD9D9D9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Color(0xb2b2b2),
                              width: 1
                            )
                          ),
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2.0.h, bottom: 2.0.h),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          hintStyle: const TextStyle(
                          ),
                          fillColor: const Color(0xD9D9D9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Пароль',
                        ),
                        onChanged: (String val) {
                          _PASSWORD = val;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0.w),
                      decoration: BoxDecoration(
                        border: Border.all()
                      ),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 1.0.w),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: const Color.fromRGBO(172, 172, 172, 1),
                                      fixedSize: const Size(200, 57),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                         )
                                      ),
                                  onPressed: (){
                                    AuthPage.controller
                                        .nextPage(
                                        duration: const Duration(milliseconds: 700),
                                        curve: Curves.easeIn);
                                  },
                                  child: const Text("Register")
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 1.0.w),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      primary: Color.fromRGBO(217, 217, 217, 1),
                                      textStyle: const TextStyle(
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                      backgroundColor: const Color.fromRGBO(140, 28, 4, 1),
                                      fixedSize: const Size(200, 57),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                         )
                                      ),
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
                              ),
                            )
                          ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}



