import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:love_link/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:love_link/view/search_Screen.dart';
import 'package:love_link/view/user_profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedScreen extends StatefulWidget {
  String? city = '';
  String? language = '';
  String? drink = '';
  String? smoke = '';
  String? martialStatus = '';

  FeedScreen({
    Key? key,
    this.city,
    this.language,
    this.drink,
    this.smoke,
    this.martialStatus,
  }) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  ProfileController profileController = Get.put(ProfileController());

  // Define filter criteria
  String selectedCity = "eachProfileInfo.name!";
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    print(profileController.allUsersProfileList.length);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Matches',
                style: GoogleFonts.ubuntu(
                  fontSize: 45,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 35,
                ),
                onPressed: () {
                  // Get.to(SearchScreen());
                },
              ),
            ],
          ),
        ),
        toolbarHeight: 80,
      ),
      body: Obx(
        () {
          // // Filter users based on selected criteria
          // List<UserProfile> filteredUsers = profileController
          //     .allUsersProfileList
          //     .where((user) =>
          //         user.city == selectedCity &&
          //         user.languageSpoken == selectedLanguage)
          //     .toList();

          return ListView.builder(
            itemCount: profileController.allUsersProfileList.length,
            itemBuilder: (context, index) {
              final eachProfileInfo =
                  profileController.allUsersProfileList[index];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        // image
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              UserProfileScreen(
                                userName: eachProfileInfo.name!,
                                profileImageURL: eachProfileInfo.imageProfile!,
                                userEmail: eachProfileInfo.email!,
                                languageSpoken: eachProfileInfo.languageSpoken!,
                                profileHeading: eachProfileInfo.profileHeading!,
                                phone: eachProfileInfo.phone!,
                                age: eachProfileInfo.age!.toString(),
                                drink: eachProfileInfo.drink!,
                                smoke: eachProfileInfo.smoke!,
                                profession: eachProfileInfo.profession!,
                                hobbies: eachProfileInfo.hobbies!,
                              ),
                            );
                          },
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                  eachProfileInfo.imageProfile.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),

                          // name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Get.to(
                                      UserProfileScreen(
                                        userName: eachProfileInfo.name!,
                                        profileImageURL:
                                            eachProfileInfo.imageProfile!,
                                        userEmail: eachProfileInfo.email!,
                                        languageSpoken:
                                            eachProfileInfo.languageSpoken!,
                                        profileHeading:
                                            eachProfileInfo.profileHeading!,
                                        phone: eachProfileInfo.phone!,
                                        age: eachProfileInfo.age!.toString(),
                                        drink: eachProfileInfo.drink!,
                                        smoke: eachProfileInfo.smoke!,
                                        profession: eachProfileInfo.profession!,
                                        hobbies: eachProfileInfo.hobbies!,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    eachProfileInfo.name! +
                                        ', ' +
                                        eachProfileInfo.age!.toString(),
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  eachProfileInfo.languageSpoken!,
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // martial status
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  eachProfileInfo.martialStatus!,
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 17,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Hobbies:  ",
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      eachProfileInfo.hobbies!,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 17,
                                        color: Colors.blue[400],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // city
                          Row(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "City:  ",
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      eachProfileInfo.city!,
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
