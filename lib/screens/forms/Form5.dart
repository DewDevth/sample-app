import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Form5 extends StatefulWidget {
  const Form5({super.key});

  @override
  State<Form5> createState() => _Form5State();
}

class _Form5State extends State<Form5> {
  // วันที่ปัจจุบัน
  DateTime _selectedDate = DateTime.now();

  // เลือกวันที่
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
    print("${_selectedDate}");
  }

// เวลาปัจจุบัน
  TimeOfDay _selectedTime = TimeOfDay.now();

  // เลือกเวลา
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Android-style DatePicker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Date: ${_selectedDate.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select Date'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Selected Time: ${_selectedTime.format(context)}',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}
