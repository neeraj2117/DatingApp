import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_link/view/feedscreen.dart';
import 'package:love_link/view/profile_screen.dart';
import 'package:love_link/view/search_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List<Widget> screens = [
    FeedScreen(),
    SearchScreen(),
    ProfileScreen(
      userID: FirebaseAuth.instance.currentUser!.uid,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (indexNumber) {
          setState(() {
            screenIndex = indexNumber;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
