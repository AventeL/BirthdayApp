import 'dart:developer';
import 'dart:io';
import 'package:birthday_app/constants/userAppModel.dart';
import 'package:birthday_app/screens/addperson.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../constants/personModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future<void> saveUser(String name) async {
    return await userCollection.doc(uid).set({name: name});
  }

  Future<List<Person>> getList() async {
    Map<String, dynamic>? data;
    final DocumentSnapshot<Object?> documentSnapshot;
    documentSnapshot = await userCollection.doc(uid).get();
    if (documentSnapshot.data() != null) {
      data = documentSnapshot.data() as Map<String, dynamic>?;
      final List<dynamic> personsList = data!['persons'] as List<dynamic>;
      return personsList
          .map((dynamic e) => Person.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      return <Person>[];
    }
  }
}


/*class DatabaseService {
  CollectionReference persons =
  FirebaseFirestore.instance.collection('users');
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadFile(file) async {
    Reference reference = storage.ref().child('persons/${DateTime.now()}.png');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  void addPerson(Person maPersonne) {
    persons.add({
      "nom": maPersonne.nom,
      "prenom": maPersonne.prenom,
      "personUrlImage": maPersonne.personUrlImage,
      "dateNaissance": maPersonne.dateNaissance,
    });
  }

  Future<List<Person>> getPersons() async {
    List<Person> persons = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('persons').get();
    querySnapshot.docs.forEach((doc) {
      Person person = Person(
          nom: doc.get('nom'),
          prenom: doc.get('prenom'),
          personUrlImage: '',
          dateNaissance: DateTime.now());
      persons.add(person);
    });
    return persons;
  }

  /*Stream<List<Person>> getPersons() {
    Query queryPersons = persons.orderBy('name', descending: false);
    return queryPersons.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Person(
            id: doc.get('id'),
            nom: doc.get('name'),
            prenom: doc.get('prenom'),
            personUrlImage: doc.get('personUrlImage'),
            dateNaissance: doc.get('dateNaissance'));
      }).toList();
    });
  }*/
}*/