import 'dart:convert';
import 'dart:js';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import '../main.dart';
import '../pages/auth.dart';
class RegisterPage extends StatelessWidget {
  RegisterPage(PageController controller, Account account, {Key? key}) : super(key: key);
  String _LOGIN = "";
  String _PASSWORD = "";
  String _EMAIL = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(70),
        child: Column(
          children: [
            const Text("Введи сюда пароль и логин"),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 16),
                child: TextField(
                  onChanged: (String val) {
                    _LOGIN = val;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Логин',
                  ),
                )
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
            Center(
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
                      onPressed: () async {
                        AuthPage.controller.previousPage(
                            duration: Duration(microseconds: 1000),
                            curve: Curves.easeInOut);
                      },
                      child: const Text("Назад")),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black87,
                          minimumSize: const Size(88, 36),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          )),
                      onPressed: () async {
                        final user = await account.create(
                            userId: _LOGIN,
                            name: _LOGIN,
                            email: _EMAIL,
                            password: sha256.convert(utf8.encode(_PASSWORD))
                                .toString()
                        );
                        if (user != null) {

                        }
                      },
                      child: const Text("Войти в аккаунт")
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}
