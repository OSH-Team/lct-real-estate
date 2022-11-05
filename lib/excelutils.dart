import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ExcelUtils{
  readFile(file){
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    return excel;
  }
}