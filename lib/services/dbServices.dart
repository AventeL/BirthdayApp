import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

import '../constants/personModel.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

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

  Future<void> addMyPersons(Person myPerson) async {
    userCollection.doc(uid).update({
      'persons': FieldValue.arrayUnion([myPerson.toJson()])
    });
  }

  Future<void> removeMyPerson(Person myPerson) async {
    userCollection.doc(uid).update({
      'persons': FieldValue.arrayRemove([myPerson.toJson()])
    });
  }

  Future<String> uploadFile(file) async {
    Reference reference =
        storage.ref().child('persons/${uid}/${DateTime.now()}.png');
    if (file != null) {
      UploadTask uploadTask = reference.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } else {
      return '';
    }
  }

  Future<void> removeFile(file) async {
    FirebaseStorage.instance.refFromURL(file).delete();
  }
}

/*class DatabaseService {
  CollectionReference persons =
  FirebaseFirestore.instance.collection('user').doc(uid).set({'person'});
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
