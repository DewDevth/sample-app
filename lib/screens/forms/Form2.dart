import 'package:flutter/material.dart';

class CheckBoxExam extends StatefulWidget {
  const CheckBoxExam({super.key});

  @override
  State<CheckBoxExam> createState() => _CheckBoxExamState();
}

class _CheckBoxExamState extends State<CheckBoxExam> {
  // เก็บค่าการเลือกของ Checkbox ในรายการ
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckboxListTile Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // CheckboxListTile รายการที่ 1
            CheckboxListTile(
              title: Text('ตัวเลือกที่ 1'),
              value: _isChecked1,
              onChanged: (bool? value) {
                // Use bool? for nullable boolean type
                setState(() {
                  _isChecked1 = value!;
                });
              },
            ),
            // CheckboxListTile รายการที่ 2
            CheckboxListTile(
              title: Text('ตัวเลือกที่ 2'),
              value: _isChecked2,
              onChanged: (bool? value) {
                // Use bool? for nullable boolean type
                setState(() {
                  _isChecked2 = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
