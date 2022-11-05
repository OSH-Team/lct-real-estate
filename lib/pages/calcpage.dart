import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:osh_main_build/pages/uploadpage.dart';
import 'package:osh_main_build/pages/uploadtablepage.dart';
class CalcPage extends StatefulWidget {
  CalcPage({Key? key}) : super(key: key);
  static PageController controller = PageController(initialPage: 0);

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  FilePickerResult? pickedFile;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: CalcPage.controller,
      scrollDirection: Axis.horizontal,
      onPageChanged: (pos){

      },
      physics: const NeverScrollableScrollPhysics(),
      children: [
        UploadPage(pickedFile),
        UploadTablePage(pickedFile)
      ],
    );
  }

}
