import 'package:flutter/material.dart';
class UploadPage extends StatelessWidget {
  const UploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
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
        ],
      ),
    );
  }
}
