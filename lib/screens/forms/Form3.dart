import 'package:flutter/material.dart';

class Form2 extends StatefulWidget {
  const Form2({super.key});

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  // ค่าที่เลือกของ Radio
  int? _selectedValue;
  void result() {
    print(_selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioListTile Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // RadioListTile รายการที่ 1
            RadioListTile(
              title: Text('ตัวเลือกที่ 1'),
              value: 1,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            // RadioListTile รายการที่ 2
            RadioListTile(
              title: Text('ตัวเลือกที่ 2'),
              value: 2,
              groupValue: _selectedValue,
              onChanged: (int? value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),

            ElevatedButton(
                onPressed: () {
                  result();
                },
                child: Text('Result'))
          ],
        ),
      ),
    );
  }
}
