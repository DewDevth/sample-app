import 'package:flutter/material.dart';
import 'package:flutter_api/screens/admin/dashboard.dart';
import 'package:flutter_api/screens/login_page.dart';
import 'package:flutter_api/screens/register_page.dart';
import 'package:flutter_api/screens/todo_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? token = "";
  // ฟังก์ชันในการอ่านค่า token จาก SharedPreferences
  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString('token');
    });
  }

  @override
  void initState() {
    super.initState();
    _loadToken();
    // print('token${token}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: TodoListPage(),
      home: token == null ? LoginPage() : DashBoard(),
    );
  }
}
