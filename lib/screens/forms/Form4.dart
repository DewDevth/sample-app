import 'package:flutter/material.dart';

class Form4 extends StatefulWidget {
  const Form4({super.key});

  @override
  State<Form4> createState() => _Form4State();
}

class _Form4State extends State<Form4> {
  // ค่าที่เลือกของ Slider
  double _currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Slider
            Slider(
              value: _currentValue,
              min: 0,
              max: 100,
              divisions: 10, // จำนวนแบ่งของ Slider
              label: '$_currentValue',
              onChanged: (double value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
            // แสดงค่าปัจจุบันของ Slider
            Text('Value: $_currentValue'),
          ],
        ),
      ),
    );
  }
}
