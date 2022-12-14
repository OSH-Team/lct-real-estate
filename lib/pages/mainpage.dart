import 'dart:html';
import 'package:osh_main_build/bars/login.dart';
import 'package:osh_main_build/main.dart';
import 'package:sizer/sizer_ext.dart';
import 'package:appwrite/appwrite.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:osh_main_build/pages/historypage.dart';
import 'package:osh_main_build/pages/uploadpage.dart';
import 'package:osh_main_build/pages/uploadtablepage.dart';
import 'package:osh_main_build/pages/auth.dart';

import 'calcpage.dart';
class MainPage extends StatefulWidget {
  MainPage(Account account, {Key? key}) : super(key: key);
  static FilePickerResult? table;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(
    initialPage: 0,
  );
  String? _AccountName = '';

  String? _AccountEmail = '';

  @override
  Widget build(BuildContext context) {
    _checkAuth(context);
    account.get().then((value){

      setState(() {
        _AccountEmail = value.email;
        _AccountName = value.name;
      });
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text('RightPrice'),
          backgroundColor: const Color.fromRGBO(140, 28, 4, 1),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 40),
              child: IconButton(
                onPressed: (){},
                icon: Image.asset('CircleContentPlace.png'),
                iconSize: 40,
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,

            children: [
              UserAccountsDrawerHeader(
                  accountName: Text(_AccountName!),
                  accountEmail: Text(_AccountEmail!),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: ClipOval(
                      child: Image.asset(
                          'user.png',
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(140, 28, 4, 1),
                ),
              ),
              ListTile(
                title: Text('?????????????? ??????????????'),
                onTap: (){
                  if(controller.position != 0){
                    controller.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  };
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('?????????????? ??????????????????'),
                onTap: (){
                  if(controller.position != 1){
                    controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  };
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                title: Text('??????????'),
                onTap: (){
                    setState(() {
                      account.deleteSessions();
                    });
                },
              )

            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              children:[
                /*Container(
                  decoration: BoxDecoration(
                    color: const Color(0xD9D9D9D9),

                    /*border: Border(
                      bottom: BorderSide(color: Color(0x66666666)),
                    ),*/
                  ),

                  child: Row(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: (){

                            },
                            iconSize: 30,
                            icon: Icon(Icons.menu,),
                        ),
                      ],
                  ),
                ),*/
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xD9D9D9D9)
                  ),
                  child: Container(
                    height: 760,
                    child: PageView(
                      controller: controller,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      children:[
                        CalcPage(),
                        HistoryPage()
                      ],
                    ),
                  ),
                )

              ],
            )
        )
    );
  }

  _checkAuth(context) async{
    try{
      var res = await account.get();
      print(res);
    }catch(e){
      print(e);
      Navigator.pushNamedAndRemoveUntil(context, "/auth", (route) => false);
    }
  }
}