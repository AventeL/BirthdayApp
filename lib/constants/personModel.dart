import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  late String nom, prenom, personUrlImage;
  late DateTime dateNaissance;

  Person(
      {required this.nom,
      required this.prenom,
      required this.personUrlImage,
      required this.dateNaissance});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        nom: json['surname'] as String,
        prenom: json['name'] as String,
        personUrlImage: json['personUrlImage'] as String,
        dateNaissance: (json['dateBirthday'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.prenom;
    data['surname'] = this.nom;
    data['personUrlImage'] = this.personUrlImage;
    data['dateBirthday'] = Timestamp.fromDate(this.dateNaissance);
    return data;
    //return [this.nom, this.prenom, this.personUrlImage, Timestamp.fromDate(this.dateNaissance)];
  }

  @override
  String toString() {
    return 'Person{nom: $nom, prenom: $prenom, personUrlImage: $personUrlImage, dateNaissance: $dateNaissance}';
  }
}
