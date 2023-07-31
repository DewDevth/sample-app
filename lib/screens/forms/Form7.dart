import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Form7 extends StatefulWidget {
  const Form7({super.key});

  @override
  State<Form7> createState() => _Form7State();
}

class _Form7State extends State<Form7> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeField Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: <Widget>[
              // DateTimeField
              FormBuilderDateTimePicker(
                name: 'date_time',
                initialValue: _selectedDateTime,
                onChanged: (value) {
                  setState(() {
                    _selectedDateTime = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Date and Time',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _fbKey.currentState?.save();
                  if (_fbKey.currentState?.validate() ?? false) {
                    print(_selectedDateTime);
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
