import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';
class UploadPage extends StatelessWidget {
  UploadPage({Key? key}) : super(key: key);
  FilePickerResult? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: InkWell(
              onTap: () async {
                pickedFile = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['xlsx'],
                  allowMultiple: false,
                );
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
                    child: Text('uploadpage')
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
