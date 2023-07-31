import 'package:flutter/material.dart';

class Form6 extends StatefulWidget {
  const Form6({super.key});

  @override
  State<Form6> createState() => _Form6State();
}

class _Form6State extends State<Form6> {
  // สถานะปัจจุบันของ Switch
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Switch
            Switch(
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            // แสดงสถานะปัจจุบันของ Switch
            Text('Switch is ${_switchValue ? 'ON' : 'OFF'}'),
          ],
        ),
      ),
    );
  }
}
