import 'package:osh_main_build/global.dart' as globals;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:osh_main_build/pages/calcpage.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
class UploadTablePage extends StatelessWidget {
  FilePickerResult? tableFile;
  UploadTablePage(FilePickerResult? table, {Key? key}) : super(key: key){
    tableFile = table;
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: FittedBox(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              height: 600,
              width: 1420,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0x66666666)),
                borderRadius: BorderRadius.circular(30),
                //color: Color(0xACACACAC),
              ),
              child: UploadTable(),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              height: 56,
              width: 900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: TextButton(
                      child: Text('Назад'),
                      style: TextButton.styleFrom(
                          side: BorderSide(
                              color: const Color.fromRGBO(102, 102, 102, 0.5)
                          ),
                          primary: Colors.black,
                          backgroundColor: const Color.fromRGBO(172, 172, 172, 1),
                          fixedSize: const Size(400, 57),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),

                          ),
                      ),
                      onPressed: (){
                        CalcPage.controller.previousPage(
                            duration: const Duration(
                                milliseconds: 700),
                            curve: Curves.easeIn);
                      },

                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text('Выполнить расчет'),
                      style: TextButton.styleFrom(
                          side: BorderSide(
                              color: const Color.fromRGBO(102, 102, 102, 0.5)
                          ),
                          primary: Color.fromRGBO(217, 217, 217, 1),
                          backgroundColor: const Color.fromRGBO(140, 28, 4, 1),
                          fixedSize: const Size(400, 57),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),

                          )
                      ),
                      onPressed: (){},

                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class UploadTable extends StatefulWidget {
  static FilePickerResult? table;
  UploadTable({Key? key}) : super(key: key);
  static void updateFile(file){
    _UploadTableState().setState(() {
      table == file;
    });
  }
  @override
  State<UploadTable> createState() => _UploadTableState();
}

class _UploadTableState extends State<UploadTable> {
   var table = globals.filePickerBytes;
  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Table(
          border: TableBorder(horizontalInside: BorderSide(color: Colors.black,width: 0.5)),
          children: _getTableRowsFromExcel(table),
        ),
      );
    }
  }
  List<TableRow> _getTableRowsFromExcel(var bytes){
    List<TableRow> tableRows = [];
    if (bytes != null) {
      var excel = SpreadsheetDecoder.decodeBytes(bytes!.toList(), update: true);
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows) {
          List<TableCell> RowCells = [];
          RowCells.add(
              TableCell(
                  child: Container(
                      constraints: BoxConstraints(minWidth: 320,minHeight: 80),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black)
                      ),
                      child: CheckBoxX()
                  )
              )
          );
          for(var cell in row){
            RowCells.add(
                  TableCell(
                      child: Container(
                          constraints: BoxConstraints(minWidth: 200, minHeight: 80,),
                          decoration: BoxDecoration(
                            //border: Border.all(color: Colors.black),
                            //borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                              child: Text(
                                  cell.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(

                                      fontSize: 14
                                  )
                              )
                          )
                )
              )
            );
          }
          tableRows.add(TableRow(children: RowCells));
        }
      }
    }
    return tableRows;
  }
   Future<void> _showExceptionDialog(context, e) async {
     return showDialog<void>(
       context: context,
       barrierDismissible: true,
       builder: (BuildContext context) {
         return AlertDialog(
           title: const Text('Auth Error'),
           content: SingleChildScrollView(
             child: ListBody(
               children: <Widget>[
                 Text(e.toString()),
               ],
             ),
           ),
           actions: <Widget>[
             TextButton(
               child: const Text('OK'),
               onPressed: () {
                 Navigator.of(context).pop();
               },
             ),
           ],
         );
       },
     );
   }
class CheckBoxX extends StatefulWidget {
  const CheckBoxX({Key? key}) : super(key: key);

  @override
  State<CheckBoxX> createState() => _CheckBoxXState();
}

class _CheckBoxXState extends State<CheckBoxX> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked, onChanged: (bool? value) {
          setState(() {
          isChecked = value!;
          });
        }
    );
  }
}

