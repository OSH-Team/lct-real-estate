import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:osh_main_build/pages/mainpage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

import 'calcpage.dart';
class UploadPage extends StatefulWidget {
  FilePickerResult? pickedFile;
  UploadPage(this.pickedFile, {Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState(pickedFile);
}

class _UploadPageState extends State<UploadPage> {
  FilePickerResult? pickedFile;
  String _text = 'Перетащите вашу талицу в это поле';

  _UploadPageState(this.pickedFile);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              child: InkWell(
                onTap: () async {
                  pickedFile = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['xlsx'],
                    allowMultiple: false,
                  ).then((value){
                    setState(() {
                      _text = value!.names.first!;
                    });
                  });
                },
                child: Container(
                  height: 451,
                  width: 722,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x66666666)),
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xACACACAC),
                  ),
                  child: Center(
                      child: Text(_text)
                  ),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 34),
              height: 56,
              width: 722,
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        side: BorderSide(
                            color: const Color.fromRGBO(102, 102, 102, 0.5)
                        ),
                        primary: Colors.black,
                        backgroundColor: const Color.fromRGBO(172, 172, 172, 1),
                        fixedSize: const Size(338, 56),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )
                    ),
                    child: const Text("Ввести вручную"),
                    onPressed: (){},

                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        side: BorderSide(
                            color: const Color.fromRGBO(102, 102, 102, 0.5)
                        ),
                        primary: Color.fromRGBO(217, 217, 217, 1),
                        textStyle: const TextStyle(
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        backgroundColor: const Color.fromRGBO(140, 28, 4, 1),
                        fixedSize: const Size(338, 56),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        )
                    ),
                      onPressed: (){
                        CalcPage.controller.animateToPage(1, duration: Duration(milliseconds: 700), curve: Curves.easeIn);
                      },
                      child: const Text("Импортировать"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      )
    );
  }
}

