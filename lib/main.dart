import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';
import 'package:sizer/sizer.dart';
import 'package:osh_main_build/pages/auth.dart';
import 'package:osh_main_build/pages/mainpage.dart';
//ку-ку ёпта
Client client = Client()
    .setEndpoint('http://95.79.97.140/v1') // Your Appwrite Endpoint
    .setProject('RightPrice')         // Your project ID
    .setSelfSigned(status: true);        // For self signed certificates, only use for development
Account account = Account(client);

void main() {
  runApp(const RightPrice());

}

class RightPrice extends StatelessWidget {
  const RightPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
              builder: (context, orientation){
                SizerUtil().init(constraints, orientation);
                client
                    .setEndpoint('http://95.79.97.140/v1') // Your API Endpoint
                    .setProject('RightPrice');
                return MaterialApp(
                  home: AuthPage(account),
                  routes: {
                    '/auth': (context) => AuthPage(account),
                    '/mainpage':(context) =>  const MainPage()
                  },
                );
              }
          );
        }
    );
  }
}




/* routes: {
          '/auth': (context) => AuthPage(account),
          '/mainpage':(context) =>  MainPage()
        },
        client
        .setEndpoint('http://95.79.97.140/v1') // Your API Endpoint
        .setProject('RightPrice');*/