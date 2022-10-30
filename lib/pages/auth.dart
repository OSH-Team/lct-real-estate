import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:osh_main_build/main.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
class AuthPage extends StatelessWidget {
  AuthPage(Account account, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RegisterWindow(account)
      ),
    );
  }
}
class RegisterWindow extends StatefulWidget {
  const RegisterWindow(Account account, {Key? key}) : super(key: key);

  @override
  State<RegisterWindow> createState() => _RegisterWindowState();
}

class _RegisterWindowState extends State<RegisterWindow> {
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  onChanged: (String val){
                    _LOGIN = val;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Логин',
                  ),
                )
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  onChanged: (String val){
                    _EMAIL= val;
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
                onChanged: (String val){
                  _PASSWORD = val;
                },
              ),
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
                  final user = await account.create(
                      userId: ID.unique(),
                      email: _EMAIL,
                      password: sha256.convert(utf8.encode(_PASSWORD)).toString(),
                      name: _LOGIN
                  ).catchError((error){
                    _showErrorDialog();
                  });
                  if(user != null){
                    _showMyDialog();
                  }
                },
                child: const Text("Создать аккаунт")),
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
                      password: sha256.convert(utf8.encode(_PASSWORD)).toString()
                  ).catchError((error){
                    _showErrorDialog();
                  });
                  if(user != null){
                    _showMyDialog();
                  }
                },
                child: const Text("Войти в аккаунт"))
          ],
        )
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Information'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Вы вошли в аккаунт'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _showErrorDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('User Information'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Ошибка входа/регистрации'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}




