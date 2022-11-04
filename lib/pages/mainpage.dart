import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:osh_main_build/pages/historypage.dart';
import 'package:osh_main_build/pages/uploadpage.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static PageController controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('Создать рассчет'),
              onTap: (){
                if(controller.position != 0){
                  controller.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                }
              },
            ),
            ListTile(
              title: Text('История рассчетов'),
              onTap: (){
                if(controller.position != 1){
                  controller.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                }
              },
            )
          ],
        ),
      ),
      body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
             UploadPage(),
             HistoryPage()
            ],
       )
    );
  }
}
