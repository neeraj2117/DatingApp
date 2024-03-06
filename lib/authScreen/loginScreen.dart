import 'package:flutter/material.dart';
import 'package:love_link/authScreen/signup_screen.dart';
import 'package:love_link/controllers/auth_controller.dart';
import 'package:love_link/utils/button.dart';
import 'package:love_link/utils/textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool showProgressBar = false;

    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // App Logo
              SizedBox(
                height: height * .10,
              ),
              Image.asset(
                'assets/final-logo.png',
                height: 200,
              ),

              // text
              SizedBox(
                height: height * .03,
              ),
              Text(
                'Flirt and meet new people',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),

              // email - textfield
              SizedBox(
                height: height * .08,
              ),
              CustomTextField(
                hintText: 'Enter Email',
                icon: Icons.email_outlined,
                controller: emailController,
              ),

              // password - textfield
              SizedBox(
                height: height * .001,
              ),
              CustomTextField(
                hintText: 'Enter Password',
                isPassword: true,
                icon: Icons.lock_outline,
                controller: passwordController,
              ),

              // login button
              SizedBox(
                height: height * .02,
              ),
              CustomButton(
                text: 'Login',
                onPressed: () async {
                  if (emailController.text.trim().isNotEmpty &&
                      passwordController.text.trim().isNotEmpty) {
                    setState(() {
                      showProgressBar = true;
                    });

                    await AuthenticationController.authController.loginUser(
                        emailController.text.trim(), passwordController.text);

                    print("Setting showProgressBar to false");

                    setState(() {
                      showProgressBar = false;
                    });
                  } else {
                    Get.snackbar(
                      "Email/Password is Missing",
                      "Please fill all the fields.",
                    );
                  }
                },
                // backgroundColor: Colors.green,
                // foregroundColor: Colors.white,
                borderRadius: 8.0,
              ),

              showProgressBar == true
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.pink,
                      ),
                    )
                  : Container(),

              // forgot password text
              Text(
                'Forgot Password ?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(
                height: height * .075,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // forgot password text
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 161, 106, 215),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text(
                        'Create',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
