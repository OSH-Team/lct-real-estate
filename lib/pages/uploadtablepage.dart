import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
class UploadTablePage extends StatelessWidget {
  FilePickerResult? tableFile;
  UploadTablePage(FilePickerResult? table, {Key? key}) : super(key: key){
    tableFile = table;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: UploadTable(tableFile),
    );
  }
}
class UploadTable extends StatefulWidget {
  FilePickerResult? table;
  UploadTable(this.table, {Key? key}) : super(key: key);

  @override
  State<UploadTable> createState() => _UploadTableState(table);
}

class _UploadTableState extends State<UploadTable> {
   FilePickerResult? table;
  _UploadTableState(this.table);
  @override
  Widget build(BuildContext context) {
    if(table == null){
      return Text('NULL');
    }else{
      return Text(table!.names.first.toString());
    }
  }
  List<TableRow> _getTableRowsFromExcel(FilePickerResult? tableFile){
    List<TableRow> tableRows = [];
    if (tableFile != null) {
      var bytes = tableFile.files.single.bytes;
      var excel = Excel.decodeBytes(bytes!);
      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows) {
          tableRows.add(TableRow(
            children: [
              TableCell(
                  child: Text(row.toString())
              )
            ]
          ));
        }
      }
    }
    _showExceptionDialog(context, tableFile!.names.first);
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
}

