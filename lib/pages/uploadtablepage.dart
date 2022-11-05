import 'package:osh_main_build/global.dart' as globals;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
class UploadTablePage extends StatelessWidget {
  FilePickerResult? tableFile;
  UploadTablePage(FilePickerResult? table, {Key? key}) : super(key: key){
    tableFile = table;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: UploadTable(),
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
          border: TableBorder.all(
            color: Colors.black
          ),
          children: _getTableColumnsFromExcel(table),
        ),
      );
    }
  }
  List<TableRow> _getTableColumnsFromExcel(var bytes){
    List<TableRow> tableRows = [];
    if (bytes != null) {
      var excel = SpreadsheetDecoder.decodeBytes(bytes!.toList(), update: true);
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows) {
          List<TableCell> RowCells = [];
          for(var cell in row){
            RowCells.add(
                  TableCell(
                      child: Center(
                          child: Text(
                              cell.toString(),
                              style: const TextStyle(
                                fontSize: 22
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

