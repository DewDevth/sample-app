import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api/screens/admin/grid_dashboard.dart';
import 'package:flutter_api/screens/admin/profile_page.dart';
import 'package:flutter_api/screens/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user_model.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String? token = "";
  User? userData;

  _loadUser() async {
    String? data = "";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      data = prefs.getString('user');

      String? jsonString = data;

// Parse the JSON string
      Map<String, dynamic>? jsonData = jsonDecode(jsonString!);

// Check if jsonData is not null before creating the User object
      User? user;
      if (jsonData != null) {
        user = User.fromJson(jsonData);
        // print('user ===== ');
        // print(jsonData['avatar']);
      }
      if (user != null) {
        // Access user properties and use them in your Flutter UI

        userData = user;
      } else {
        // Handle the case when there's no valid user data in SharedPreferences
        print("No user data found in SharedPreferences.");
      }
    });

    // print(userData);
  }

  @override
  void initState() {
    super.initState();

    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff392850),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (userData != null)
                        Text(
                          '${userData?.fname} ${userData?.lname}',
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'DashBoard',
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  if (userData?.avatar != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(userData?.avatar ?? ''),
                      child: PopupMenuButton<String>(
                        onSelected: (value) {
                          // Handle the selected menu item here
                          switch (value) {
                            case 'profile':
                              // Navigate to the user's profile screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProfilePage(), // หน้าที่ต้องการแสดงเมื่อเปลี่ยนหน้า
                                ),
                              );
                              break;
                            case 'settings':
                              // Navigate to the settings screen
                              break;
                            case 'logout':
                              // Perform logout operation

                              clearSharedPreferences(); // Clear data from SharedPreferences
                              logoutCallback();
                              break;
                          }
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: 'profile',
                              child: Text('Profile'),
                            ),
                            PopupMenuItem(
                              value: 'settings',
                              child: Text('Settings'),
                            ),
                            PopupMenuItem(
                              value: 'logout',
                              child: Text('Logout'),
                            ),
                          ];
                        },
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GridDashboard(),
          ],
        ));
  }

  void logoutCallback() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
