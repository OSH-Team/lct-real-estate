import 'dart:io';

import 'package:excel/excel.dart';

class ExcelUtils{
  readFile(file){
    var bytes = File(file).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    return excel;
  }
}