import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/screens/admin/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  String fname = "";
  String lname = "";
  String username = "";
  String email = "";
  String? avatar;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    String? data = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = prefs.getString('user');
      Map<String, dynamic>? jsonData = jsonDecode(data!);
      User? user;
      if (jsonData != null) {
        user = User.fromJson(jsonData);
      }
      if (user != null) {
        fname = user.fname ?? "";
        lname = user.lname ?? "";
        username = user.username ?? "";
        email = user.email ?? "";
        avatar = user.avatar ?? "";

        fnameController.text = fname;
        lnameController.text = lname;
        usernameController.text = username;
        emailController.text = email;
      } else {
        print("No user data found in SharedPreferences.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                //logo
                if (avatar != null)
                  Center(
                    child: Image.network(
                      avatar!,
                      width: 300,
                    ),
                  ),
                SizedBox(
                  height: 50,
                ),

                // Hello again!
                Text(
                  'Profile',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                //emai textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black, // Set the text color to black
                        ),
                        cursorColor: Colors.deepPurple,
                        controller: fnameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'First Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.deepPurple,
                        controller: lnameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Last Name',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ), //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.deepPurple,
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ), //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.deepPurple,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DashBoard(), // Replace with your Dashboard screen
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.deepPurple),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //back  button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: OutlinedButton(
                    // onPressed: loginUser,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DashBoard(), // Replace with your Dashboard screen
                        ),
                      );
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(width: 2, color: Colors.deepPurple),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //not a member? register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
