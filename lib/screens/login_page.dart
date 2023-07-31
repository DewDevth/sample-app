// import 'package:auth_app/screens/sigup_screen.dart';
// import 'package:auth_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/screens/admin/dashboard.dart';
import 'package:flutter_api/screens/register_page.dart';
import 'package:flutter_api/utils/snackbar_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                Center(
                  child:
                      Image.asset('assets/images/undraw_welcome_cats_thqn.png'),
                ),
                SizedBox(
                  height: 50,
                ),

                // Hello again!
                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
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
                        controller: emailController,
                        decoration: const InputDecoration(
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
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
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
                  child: InkWell(
                    onTap: loginUser,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
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
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to check if both email and password are provided
  bool _isInputValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> loginUser() async {
    //submit data to the server
    if (!_isInputValid()) {
      showErrorMessage(context, message: "Please fill in all fields.");
    } else {
      //validate success
      final isSuccess = await AuthService.loginUser(body);
      //show success or fail message based on status
      if (isSuccess.isNotEmpty) {
        showSuccessMessage(context, message: "Login Successfully");

        // print(isSuccess);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoard(),
          ),
        );
      } else {
        showErrorMessage(context, message: "Login Failed");
      }
    }
  }

  Map get body {
    //Get the data from form
    final password = passwordController.text;
    final email = emailController.text;
    final body = {"username": email, "password": password, "expiresIn": 60000};

    return body;
  }
}
