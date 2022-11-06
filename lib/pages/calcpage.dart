import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:osh_main_build/pages/uploadpage.dart';
import 'package:osh_main_build/pages/uploadtablepage.dart';
class CalcPage extends StatelessWidget {
  CalcPage({Key? key}) : super(key: key);
  static PageController controller = PageController(initialPage: 0);

  FilePickerResult? pickedFile;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
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
// osh-husegfhoguoesurgoesfhgoershgahiorg