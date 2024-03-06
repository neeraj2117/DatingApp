import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:love_link/view/user_profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';

class CustomQueryDocumentSnapshot<T> {
  final T data;

  CustomQueryDocumentSnapshot({required this.data});
}

class CustomQuerySnapshot<T> {
  final List<CustomQueryDocumentSnapshot<T>> docs;

  CustomQuerySnapshot({required this.docs});
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  @override
  void initState() {
    _fetchMyProfileImage();
    super.initState();
  }

  TextEditingController _searchController = TextEditingController();
  List<CustomQueryDocumentSnapshot<Map<String, dynamic>>> searchResults = [];
  String myProfileImageURL = '';

  List _allResults = [];
  List _resultsList = [];

  Future<void> _fetchMyProfileImage() async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUserId)
              .get();

      setState(() {
        myProfileImageURL = userSnapshot['imageProfile'] ?? '';
      });
    } catch (e) {
      print('Error fetching profile image: $e');
    }
  }

  searchResultsList() async {
    var showResults = [];
    if (_searchController.text != "") {
      for (var clientSnapShot in _allResults) {
        var name = clientSnapShot['name'].toString().toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapShot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getClientStream() async {
    var data = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('name')
        .get();

    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
                style: GoogleFonts.ubuntu(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  myProfileImageURL,
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: TextField(
              autofocus: true,
              controller: _searchController,
              // onChanged: (query) {
              //   _performSearch(query);
              // },
              onChanged: (query) {
                // _performSearch(query);
                searchResultsList();
              },
              decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 228, 225, 225),
                filled: true,
                hintText: 'Search...',
                suffixIcon: Icon(
                  Icons.search,
                  size: 25,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          if (_searchController.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _resultsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        _resultsList[index]['imageProfile'],
                      ),
                    ),
                    title: Text(
                      _resultsList[index]['name'],
                    ),
                    subtitle: Text(
                      _resultsList[index]['email'],
                    ),
                    trailing: Text(
                      _resultsList[index]['phone'],
                    ),
                    onTap: () {
                      _showUserProfile(
                        _resultsList[index]['name'],
                        _resultsList[index]['imageProfile'],
                        _resultsList[index]['email'],
                        _resultsList[index]['languageSpoken'],
                        _resultsList[index]['profileHeading'],
                        _resultsList[index]['phone'].toString(),
                        _resultsList[index]['age'],
                        _resultsList[index]['drink'],
                        _resultsList[index]['smoke'],
                        _resultsList[index]['profession'],
                        _resultsList[index]['hobbies'],
                      );
                    },
                  );
                },
              ),
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Search For User...',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Lottie.asset(
                  'assets/search.json',
                ),
              ],
            )
        ],
      ),
    );
  }

  void _showUserProfile(
    String userName,
    String profileImageURL,
    String userEmail,
    String languageSpoken,
    String profileHeading,
    String userPhone,
    int age,
    String drink,
    String smoke,
    String profession,
    String hobbies,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserProfileScreen(
          hobbies: hobbies,
          userName: userName,
          profileImageURL: profileImageURL,
          userEmail: userEmail,
          languageSpoken: languageSpoken,
          profileHeading: profileHeading,
          phone: userPhone,
          age: age.toString(),
          drink: drink,
          smoke: smoke,
          profession: profession,
        ),
      ),
    );
  }
}
