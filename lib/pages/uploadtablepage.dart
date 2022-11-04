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
  FilePickerResult? tableFile;
  UploadTable(table, {Key? key}) : super(key: key){
    tableFile = table;
  }

  @override
  State<UploadTable> createState() => _UploadTableState(tableFile);
}

class _UploadTableState extends State<UploadTable> {
   FilePickerResult? tableFile;
  _UploadTableState(table){
    tableFile = table;
  }
  @override
  Widget build(BuildContext context) {
    return Table(
        children: _getTableRowsFromExcel(tableFile),
    );
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
    return tableRows;
  }
}
