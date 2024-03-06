import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:love_link/authScreen/loginScreen.dart';
import 'package:love_link/models/person.dart' as personModel;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:love_link/splash_screen.dart';
import 'package:love_link/view/homescreen.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  late Rx<User?> firebaseCurrUser;
  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "You have succesfully picked your profile image");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  pickImageFileFromCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "You have succesfully caputred your profile image");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage(File imageFile) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    String downloadUrlofImage = await snapshot.ref.getDownloadURL();

    return downloadUrlofImage;
  }

  createNewUserAccount(
    // personal info

    String? uid,
    File imageProfile,
    String email,
    String password,
    String name,
    String age,
    String phone,
    String city,
    String country,
    String profileHeading,
    String lookingForInaPartner,
    String hobbies,

    // appearance

    String height,
    String weight,
    String bodyType,

    // life style

    String drink,
    String smoke,
    String martialStatus,
    String haveChildren,
    String noOfChildren,
    String profession,
    String employmentStatus,
    String income,
    String livingSituation,
    String relationshipYouAreLookingFor,

    // cultural values

    String nationality,
    String education,
    String languageSpoken,
    String religion,
    String ethinicity,
  ) async {
    try {
      // 1. authenticate user and create user with email and password
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // 2. upload image to storage
      String urlOfDownloadedImage = await uploadImageToStorage(imageProfile);

      // 3. save user to firebase database
      personModel.Person personInstance = personModel.Person(
        // personal info
        uid: FirebaseAuth.instance.currentUser!.uid,
        imageProfile: urlOfDownloadedImage,
        email: email,
        name: name,
        password: password,
        age: int.parse(age),
        phone: phone,
        city: city,
        country: country,
        profileHeading: profileHeading,
        lookingForInaPartner: lookingForInaPartner,
        publishedDateTime: DateTime.now().microsecondsSinceEpoch,
        hobbies: hobbies,

        // appearance
        height: height,
        weight: weight,
        bodyType: bodyType,

        //  lifestyle
        drink: drink,
        smoke: smoke,
        martialStatus: martialStatus,
        haveChildren: haveChildren,
        noOfChildren: noOfChildren,
        employmentStatus: employmentStatus,
        profession: profession,
        income: income,
        livingSituation: livingSituation,
        relationshipYouAreLookingFor: relationshipYouAreLookingFor,

        // cultural values
        nationality: nationality,
        education: education,
        languageSpoken: languageSpoken,
        religion: religion,
        ethinicity: ethinicity,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());

      Get.snackbar(
          "Account Created", "Congratulations, your account has been created.");
      Get.to(HomeScreen());
    } catch (e) {
      Get.snackbar("Account Creation Unsuccessfull", "Error occured: $e");
    }
  }

  loginUser(String emailUser, String passwordUser) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailUser, password: passwordUser);

      Get.snackbar("Login Succesfull", "You\'re logged in succesfully.");
      Get.to(HomeScreen());
    } catch (e) {
      Get.snackbar("Login Unsuccesfull", "Error occured: $e");
    }
  }

  // checkIfUserIsLoggedIn(User? currentUser) {
  //   print("User state changed: $currentUser");
  //   if (currentUser == null) {
  //     Get.to(SplashScreen());
  //   } else {
  //     Get.to(HomeScreen());
  //   }
  // }
  // @override
  // void onReady() {
  //   super.onReady();
  //   firebaseCurrUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  //   firebaseCurrUser.bindStream(FirebaseAuth.instance.authStateChanges());
  //   ever(firebaseCurrUser, checkIfUserIsLoggedIn);
  // }
}
