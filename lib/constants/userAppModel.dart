import 'package:birthday_app/constants/personModel.dart';

class AppUser {
  late String uid, nom;
  late List<Person> PersonList;

  AppUser({required this.nom, required this.uid, required this.PersonList});


  @override
  String toString() {
    return 'Person{nom: $nom, uid: $uid}';
  }
}
