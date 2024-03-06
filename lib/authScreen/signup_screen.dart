import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_link/controllers/auth_controller.dart';
import 'package:love_link/utils/button.dart';
import 'package:love_link/utils/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showProgressBar = false;

  // personal info
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController profileController = TextEditingController();
  TextEditingController lookingForController = TextEditingController();
  TextEditingController hobbies = TextEditingController();

  // appearance
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bodyTypeController = TextEditingController();

  // life style
  TextEditingController drinkController = TextEditingController();
  TextEditingController smokeController = TextEditingController();
  TextEditingController martialStatusController = TextEditingController();
  TextEditingController haveChildrenController = TextEditingController();
  TextEditingController noOfChildrenController = TextEditingController();
  TextEditingController employmentStatusController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController incomeController = TextEditingController();
  TextEditingController livingSituationController = TextEditingController();
  TextEditingController relationshipLookingForController =
      TextEditingController();

  // background
  TextEditingController nationalityController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController languageSpokenController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController ethinicityController = TextEditingController();

  var authenticationController = AuthenticationController.authController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Signup',
          style: GoogleFonts.ubuntu(
            fontSize: 31,
            fontWeight: FontWeight.w500,
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
                height: 21,
                width: 21,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // choose image
              const SizedBox(
                height: 10,
              ),
              authenticationController.imageFile == null
                  ? CircleAvatar(
                      radius: 130,
                      backgroundImage: AssetImage('assets/user.png'),
                      backgroundColor: Colors.black,
                    )
                  : Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: FileImage(
                            File(
                              authenticationController.imageFile!.path,
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromGallery();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: Icon(
                      Icons.image_outlined,
                      color: Colors.blue[300],
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await authenticationController.pickImageFileFromCamera();
                      setState(() {
                        authenticationController.imageFile;
                      });
                    },
                    icon: Icon(
                      Icons.camera_outlined,
                      color: Colors.blue[300],
                      size: 30,
                    ),
                  )
                ],
              ),

              // personal - info

              SizedBox(
                height: height * .01,
              ),
              Text(
                'Personal Information :',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * .02,
              ),

              // name
              CustomTextField(
                hintText: 'Enter Username',
                icon: Icons.person_outline,
                controller: nameController,
              ),

              // email
              CustomTextField(
                hintText: 'Enter Email',
                icon: Icons.email_outlined,
                controller: emailController,
              ),

              // password
              CustomTextField(
                hintText: 'Enter Password',
                icon: Icons.lock_outline,
                isPassword: true,
                controller: passwordController,
              ),

              // age
              CustomTextField(
                hintText: 'Enter Age',
                icon: Icons.numbers,
                controller: ageController,
              ),

              // phone
              CustomTextField(
                hintText: 'Enter Phone Number',
                icon: Icons.phone,
                controller: phoneController,
              ),

              // city
              CustomTextField(
                hintText: 'Enter City',
                icon: Icons.location_city,
                controller: cityController,
              ),

              // country
              CustomTextField(
                hintText: 'Enter Country',
                icon: Icons.location_city,
                controller: countryController,
              ),

              // profile
              CustomTextField(
                hintText: 'Enter Profile Heading',
                icon: Icons.text_fields,
                controller: profileController,
              ),

              // looking for in partner
              CustomTextField(
                hintText: 'What you\'re looking for in a Partner?',
                icon: Icons.face,
                controller: lookingForController,
              ),

              // hobbies
              CustomTextField(
                hintText: 'What are your hobbies?',
                icon: Icons.sports_football,
                controller: hobbies,
              ),

              // appearance

              SizedBox(
                height: height * .03,
              ),
              Text(
                'Appearance :',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),

              // height
              CustomTextField(
                hintText: 'Enter height',
                icon: Icons.insert_chart,
                controller: heightController,
              ),

              // weight
              CustomTextField(
                hintText: 'Enter weight',
                icon: Icons.table_chart,
                controller: weightController,
              ),

              // body type
              CustomTextField(
                hintText: 'Enter body type',
                icon: Icons.type_specimen,
                controller: bodyTypeController,
              ),

              // Life style

              SizedBox(
                height: height * .03,
              ),
              Text(
                'Life Style :',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),

              // drink
              CustomTextField(
                hintText: 'Drink',
                icon: Icons.local_drink,
                controller: drinkController,
              ),

              // smoke
              CustomTextField(
                hintText: 'Smoke',
                icon: Icons.smoking_rooms,
                controller: smokeController,
              ),

              // martial Status
              CustomTextField(
                hintText: 'Martial Status',
                icon: Icons.person_2,
                controller: martialStatusController,
              ),

              // have children
              CustomTextField(
                hintText: 'Do you have children?',
                icon: Icons.person_3,
                controller: haveChildrenController,
              ),

              // noOfCHildren
              CustomTextField(
                hintText: 'Number of children',
                icon: Icons.person_3_rounded,
                controller: noOfChildrenController,
              ),

              // profession
              CustomTextField(
                hintText: 'Profession',
                icon: Icons.business_center,
                controller: professionController,
              ),

              // employment status
              CustomTextField(
                hintText: 'Employment status',
                icon: CupertinoIcons.rectangle_stack_person_crop_fill,
                controller: employmentStatusController,
              ),

              // income
              CustomTextField(
                hintText: 'Icome',
                icon: CupertinoIcons.money_dollar_circle,
                controller: incomeController,
              ),

              // living situation
              CustomTextField(
                hintText: 'Living situation',
                icon: CupertinoIcons.person_2_square_stack,
                controller: livingSituationController,
              ),

              // relationship looking for?
              CustomTextField(
                hintText: 'What relationship are you looking for?',
                icon: Icons.person_2,
                controller: relationshipLookingForController,
              ),

              // background

              SizedBox(
                height: height * .03,
              ),
              Text(
                'Background - Cultural Values :',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * .02,
              ),

              // nation
              CustomTextField(
                hintText: 'Nationality',
                icon: Icons.flag_circle_outlined,
                controller: nationalityController,
              ),

              // education
              CustomTextField(
                hintText: 'Education',
                icon: Icons.history_edu,
                controller: educationController,
              ),

              // language spoken
              CustomTextField(
                hintText: 'Language spoken',
                icon: CupertinoIcons.person_badge_plus_fill,
                controller: languageSpokenController,
              ),

              // religion
              CustomTextField(
                hintText: 'Religion',
                icon: CupertinoIcons.checkmark_seal_fill,
                controller: religionController,
              ),

              // ethinicity
              CustomTextField(
                hintText: 'Ethinicity',
                icon: CupertinoIcons.eye,
                controller: ethinicityController,
              ),
              SizedBox(
                height: height * .01,
              ),

              showProgressBar == true
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.pink,
                      ),
                    )
                  : Container(),

              // create account button
              SizedBox(
                height: height * .01,
              ),
              CustomButton(
                text: 'Create',
                onPressed: () async {
                  if (authenticationController.imageFile != null) {
                    await Future.delayed(Duration(seconds: 2));
                    // final currentUser = FirebaseAuth.instance.currentUser;

                    if (
                        // personal info
                        nameController.text.trim().isNotEmpty &&
                            emailController.text.trim().isNotEmpty &&
                            passwordController.text.trim().isNotEmpty &&
                            ageController.text.trim().isNotEmpty &&
                            phoneController.text.trim().isNotEmpty &&
                            cityController.text.trim().isNotEmpty &&
                            countryController.text.trim().isNotEmpty &&
                            profileController.text.trim().isNotEmpty &&
                            lookingForController.text.trim().isNotEmpty &&

                            // appearance
                            heightController.text.trim().isNotEmpty &&
                            weightController.text.trim().isNotEmpty &&
                            bodyTypeController.text.trim().isNotEmpty &&

                            // life style
                            drinkController.text.trim().isNotEmpty &&
                            smokeController.text.trim().isNotEmpty &&
                            martialStatusController.text.trim().isNotEmpty &&
                            haveChildrenController.text.trim().isNotEmpty &&
                            noOfChildrenController.text.trim().isNotEmpty &&
                            professionController.text.trim().isNotEmpty &&
                            employmentStatusController.text.trim().isNotEmpty &&
                            incomeController.text.trim().isNotEmpty &&
                            livingSituationController.text.trim().isNotEmpty &&
                            relationshipLookingForController.text
                                .trim()
                                .isNotEmpty &&

                            // cultural values
                            nationalityController.text.trim().isNotEmpty &&
                            educationController.text.trim().isNotEmpty &&
                            languageSpokenController.text.trim().isNotEmpty &&
                            religionController.text.trim().isNotEmpty &&
                            ethinicityController.text.trim().isNotEmpty &&
                            hobbies.text.trim().isNotEmpty) {
                      setState(() {
                        showProgressBar = true;
                      });

                      await authenticationController.createNewUserAccount(
                        // personal info
                        FirebaseAuth.instance.currentUser?.uid,
                        authenticationController.profileImage!,
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        nameController.text.trim(),
                        ageController.text.trim(),
                        phoneController.text.trim(),
                        cityController.text.trim(),
                        countryController.text.trim(),
                        profileController.text.trim(),
                        lookingForController.text.trim(),

                        // appearance
                        heightController.text.trim(),
                        weightController.text.trim(),
                        bodyTypeController.text.trim(),

                        // life style
                        drinkController.text.trim(),
                        smokeController.text.trim(),
                        martialStatusController.text.trim(),
                        haveChildrenController.text.trim(),
                        noOfChildrenController.text.trim(),
                        professionController.text.trim(),
                        employmentStatusController.text.trim(),
                        incomeController.text.trim(),
                        livingSituationController.text.trim(),
                        relationshipLookingForController.text.trim(),

                        // cultural values
                        nationalityController.text.trim(),
                        educationController.text.trim(),
                        languageSpokenController.text.trim(),
                        religionController.text.trim(),
                        ethinicityController.text.trim(),
                        hobbies.text.trim(),
                      );

                      setState(() {
                        showProgressBar = false;
                        authenticationController.imageFile = null;
                      });
                    } else {
                      Get.snackbar(
                          "Field is Empty", "Please fill all the fields.");
                    }
                  } else {
                    Get.snackbar("Image File Missing",
                        "Please pick an image file from the gallery.");
                  }
                },
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                borderRadius: 8.0,
                padding: 20.0,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // forgot password text
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
