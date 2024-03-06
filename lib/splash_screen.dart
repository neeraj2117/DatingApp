import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:love_link/authScreen/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Future.delayed(
      Duration(milliseconds: 2000),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: Center(
      child: Column(
          children: [
            // app - logo
            SizedBox(
              height: height * .14,
            ),
            Lottie.asset(
              'assets/animation1.json',
            ),

            // text
            Text(
              'Streaming Singles',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: height * .01,
            ),
            Text(
              'Flirt and meet new people',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
