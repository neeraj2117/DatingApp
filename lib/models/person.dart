import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  // personal info

  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phone;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;
  int? publishedDateTime;

  // appearance

  String? height;
  String? weight;
  String? bodyType;

  // life style

  String? drink;
  String? smoke;
  String? martialStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? relationshipYouAreLookingFor;
  String? hobbies;

  // cultural values

  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethinicity;

  Person({
    required this.uid,
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phone,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDateTime,
    this.height,
    this.weight,
    this.bodyType,
    this.drink,
    this.smoke,
    this.martialStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.relationshipYouAreLookingFor,
    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethinicity,
    this.hobbies,
  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
      // personal info
      uid: dataSnapshot["uid"],
      name: dataSnapshot["name"],
      imageProfile: dataSnapshot["imageProfile"],
      email: dataSnapshot["email"],
      password: dataSnapshot["password"],
      age: dataSnapshot["age"],
      phone: dataSnapshot["phone"],
      city: dataSnapshot["city"],
      country: dataSnapshot["country"],
      profileHeading: dataSnapshot["profileHeading"],
      lookingForInaPartner: dataSnapshot["lookingForInaPartner"],
      publishedDateTime: dataSnapshot["publishedDateTime"],
      hobbies: dataSnapshot["hobbies"],

      //  body type and appearance
      height: dataSnapshot["height"],
      weight: dataSnapshot["weight"],
      bodyType: dataSnapshot["bodyType"],

      //life style
      drink: dataSnapshot["drink"],
      smoke: dataSnapshot["smoke"],
      martialStatus: dataSnapshot["martialStatus"],
      haveChildren: dataSnapshot["haveChildren"],
      noOfChildren: dataSnapshot["noOfChildren"],
      profession: dataSnapshot["profession"],
      employmentStatus: dataSnapshot["employmentStatus"],
      income: dataSnapshot["income"],
      livingSituation: dataSnapshot["livingSituation"],
      relationshipYouAreLookingFor:
          dataSnapshot["relationshipYouAreLookingFor"],

      // cultural values
      nationality: dataSnapshot["nationality"],
      education: dataSnapshot["education"],
      languageSpoken: dataSnapshot["languageSpoken"],
      religion: dataSnapshot["religion"],
      ethinicity: dataSnapshot["ethinicity"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "imageProfile": imageProfile,
        "email": email,
        "password": password,
        "name": name,
        "age": age,
        "phone": phone,
        "city": city,
        "country": country,
        "profileHeading": profileHeading,
        "lookingForInaPartner": lookingForInaPartner,
        "publishedDateTime": publishedDateTime,
        "hobbies": hobbies,
        "height": height,
        "weight": weight,
        "bodyType": bodyType,
        "drink": drink,
        "smoke": smoke,
        "martialStatus": martialStatus,
        "haveChildren": haveChildren,
        "noOfChildren": noOfChildren,
        "profession": profession,
        "employmentStatus": employmentStatus,
        "income": income,
        "livingSituation": livingSituation,
        "relationshipYouAreLookingFor": relationshipYouAreLookingFor,
        "nationality": nationality,
        "education": education,
        "languageSpoken": languageSpoken,
        "religion": religion,
        "ethinicity": ethinicity,
      };
}
