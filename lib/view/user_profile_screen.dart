import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileScreen extends StatelessWidget {
  final String userName;
  final String profileImageURL;
  final String userEmail;
  final String languageSpoken;
  final String profileHeading;
  final String phone;
  final String age;
  final String drink;
  final String smoke;
  final String profession;
  final String hobbies;

  const UserProfileScreen({
    Key? key,
    required this.userName,
    required this.profileImageURL,
    required this.userEmail,
    required this.languageSpoken,
    required this.profileHeading,
    required this.phone,
    required this.age,
    required this.drink,
    required this.smoke,
    required this.profession,
    required this.hobbies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '$userName : Profile',
          style: GoogleFonts.ubuntu(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 21.0),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                "assets/x.png",
                height: 22,
                width: 22,
              ),
            ),
          ),
        ],
        toolbarHeight: 60,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 310,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(profileImageURL),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "$userName" + ", " + "$age",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$profileHeading" + "",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),

          // extra details

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "$userEmail",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "$languageSpoken",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "$phone",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "$languageSpoken",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "Drink: $drink",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "Smoke: $smoke",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "$languageSpoken",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
//               Container(
//   decoration: BoxDecoration(
//     color: Colors.grey[300],
//     borderRadius: BorderRadius.circular(12),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
//     child: Row(
//       children: [
//         if (isLanguageData) // Replace isLanguageData with your condition
//           Icon(Icons.language, color: Colors.black, size: 18), // Add your language icon
//         SizedBox(width: isLanguageData ? 6 : 0), // Add spacing if language icon is present
//         Text(
//           "$languageSpoken",
//           style: TextStyle(
//             fontSize: 16,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     ),
//   ),
// )
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
                  child: Text(
                    "Hobbies: $hobbies",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // cancel and heart icon
          Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/x.png",
                    height: 65,
                    width: 65,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/check.png",
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
