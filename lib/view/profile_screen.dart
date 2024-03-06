import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  String? userID;

  ProfileScreen({super.key, this.userID});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // personal info
  String imageProfile = '';
  String name = '';
  String age = '';
  String phone = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookinForInaPartner = '';
  String hobbies = '';

  // appearance

  String height = '';
  String weight = '';
  String bodyType = '';

  // life style

  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String havChildren = '';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String relationshipLookingFor = '';

  // cuttural values

  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethinicity = '';

  // slider img
  String urlImage1 =
      "https://firebasestorage.googleapis.com/v0/b/datingapp-b60b9.appspot.com/o/Place%20Holder%2Fuser.png?alt=media&token=0c63fac3-93f4-40f3-8a08-60ab68f6fdf7";

  retrieveUserInfo() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then(
      (snapshot) {
        if (snapshot.exists) {
          if (snapshot.data()![imageProfile] != null) {
            setState(() {
              // urlImage1 = snapshot.data()!["urlImage1"];
              imageProfile = snapshot.data()!["imageProfile"];

              // print("Profile Image URL: $imageProfile");
            });
          }
          setState(() {
            // personal info

            imageProfile = snapshot.data()!["imageProfile"] ?? urlImage1;
            name = snapshot.data()!["name"];
            age = snapshot.data()!["age"].toString();
            phone = snapshot.data()!["phone"];
            city = snapshot.data()!["city"];
            country = snapshot.data()!["country"];
            profileHeading = snapshot.data()!["profileHeading"];
            lookinForInaPartner = snapshot.data()!["lookingForInaPartner"];
            hobbies = snapshot.data()!["hobbies"];

            // appearance
            height = snapshot.data()!["height"];
            weight = snapshot.data()!["weight"];
            bodyType = snapshot.data()!["bodyType"];

            // life style
            drink = snapshot.data()!["drink"];
            smoke = snapshot.data()!["smoke"];
            martialStatus = snapshot.data()!["martialStatus"];
            havChildren = snapshot.data()!["haveChildren"];
            noOfChildren = snapshot.data()!["noOfChildren"];
            profession = snapshot.data()!["profession"];
            employmentStatus = snapshot.data()!["employmentStatus"];
            income = snapshot.data()!["income"];
            livingSituation = snapshot.data()!["livingSituation"];
            relationshipLookingFor =
                snapshot.data()!["relationshipYouAreLookingFor"];

            // cultural values
            nationality = snapshot.data()!["nationality"];
            education = snapshot.data()!["education"];
            languageSpoken = snapshot.data()!["languageSpoken"];
            religion = snapshot.data()!["religion"];
            ethinicity = snapshot.data()!["ethinicity"];
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retrieveUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          name,
          style: GoogleFonts.ubuntu(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 1),
          child: Column(
            children: [
              // image
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 120,
                backgroundImage: NetworkImage(
                  imageProfile,
                ),
              ),

              // personal info title
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Personal info : ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Table(
                  children: [
                    // name
                    TableRow(
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //age
                    TableRow(
                      children: [
                        Text(
                          'Age: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          age,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //phone
                    TableRow(
                      children: [
                        Text(
                          'Phone Number: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          phone,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //city
                    TableRow(
                      children: [
                        Text(
                          'City: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          city,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //country
                    TableRow(
                      children: [
                        Text(
                          'Country: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          country,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //looking for
                    TableRow(
                      children: [
                        Text(
                          'Seeking: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          lookinForInaPartner,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    // Hobbies
                    TableRow(
                      children: [
                        Text(
                          'Hobbies: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          hobbies,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // appearance title
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Appearance info : ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Table(
                  children: [
                    // height
                    TableRow(
                      children: [
                        Text(
                          'Height: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          height,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //weight
                    TableRow(
                      children: [
                        Text(
                          'Weight: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          weight,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //bodyType
                    TableRow(
                      children: [
                        Text(
                          'Body Type: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          bodyType,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // life style title
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Life Style info : ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Table(
                  children: [
                    // drink
                    TableRow(
                      children: [
                        Text(
                          'Drink: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          drink,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //smoke
                    TableRow(
                      children: [
                        Text(
                          'Smoke: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          smoke,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //martial status
                    TableRow(
                      children: [
                        Text(
                          'Martial Status: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          martialStatus,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //havechildren
                    TableRow(
                      children: [
                        Text(
                          'Have children: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          havChildren,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //noOfchildren
                    TableRow(
                      children: [
                        Text(
                          'No. of Children: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          noOfChildren,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //profession
                    TableRow(
                      children: [
                        Text(
                          'Profession: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          profession,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //employment status
                    TableRow(
                      children: [
                        Text(
                          'Employment Status: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          employmentStatus,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //income
                    TableRow(
                      children: [
                        Text(
                          'Income: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          income,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //living situation
                    TableRow(
                      children: [
                        Text(
                          'Living Situation: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          livingSituation,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),
                    //relationship looking for?
                    TableRow(
                      children: [
                        Text(
                          'Relationship looking for: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          relationshipLookingFor,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // cultural values title
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Background- Cultural values : ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
                decoration: BoxDecoration(
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Table(
                  children: [
                    // nation
                    TableRow(
                      children: [
                        Text(
                          'Nationality: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          nationality,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),

                    //education
                    TableRow(
                      children: [
                        Text(
                          'Education: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          education,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),

                    //language Spoken
                    TableRow(
                      children: [
                        Text(
                          'Language Spoken: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          languageSpoken,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),

                    //religion
                    TableRow(
                      children: [
                        Text(
                          'Religion: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          religion,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    TableRow(
                      children: [Text(''), Text('')],
                    ),

                    //ethinicity
                    TableRow(
                      children: [
                        Text(
                          'Ethinicity: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          noOfChildren,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
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
