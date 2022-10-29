import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:osh_main_build/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AuthPage extends StatelessWidget {
  AuthPage(Account account, {Key? key}) : super(key: key);

  String _LOGIN = "";
  String _PASSWORD = "";
  String _EMAIL = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
                        password: _PASSWORD,
                        name: _LOGIN
                    );
                  },
                  child: const Text("Создать аккаунт"))
            ],
          )
        ),
      ),
    );
  }
}
