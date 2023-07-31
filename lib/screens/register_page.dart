import 'package:flutter/material.dart';
import 'package:flutter_api/screens/login_page.dart';
import 'package:flutter_api/utils/snackbar_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                const SizedBox(
                  height: 50,
                ),
                //logo
                Center(
                  child: Image.asset(
                    'assets/images/undraw_Access_account_re_8spm-PhotoRoom.png-PhotoRoom.png',
                    width: 250,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                // Hello again!
                Text(
                  'SIGNUP',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  ),
                ),

                const SizedBox(
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
                const SizedBox(
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
                        decoration: const InputDecoration(
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
                const SizedBox(
                  height: 10,
                ),

                // Confirm password textfield
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
                        controller:
                            confirmPasswordController, // Use a new TextEditingController for Confirm Password
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: register,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'SignUp',
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
                const SizedBox(
                  height: 25,
                ),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'have a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login now',
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

  // Function to check if the passwords match
  bool _passwordsMatch() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    return password == confirmPassword;
  }

  // Function to check if both email and password are provided
  bool _isInputValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  Future<void> register() async {
    //submit data to the server
    if (!_isInputValid()) {
      showErrorMessage(context, message: "Please fill in all fields.");
    } else if (!_passwordsMatch()) {
      showErrorMessage(context, message: "Passwords do not match.");
    } else {
      //validate success
      final isSuccess = await AuthService.registerUser(body);
      //show success or fail message based on status
      if (isSuccess) {
        // print(isSuccess);
        showSuccessMessage(context, message: "User Registered Successfully");
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else {
        showErrorMessage(context, message: "User Registered Failed");
      }
    }
  }

  Map get body {
    //Get the data from form
    final password = passwordController.text;
    final email = emailController.text;
    final body = {
      "email": email,
      "password": password,
    };

    return body;
  }
}
