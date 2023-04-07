import 'package:birthday_app/constants/constants.dart';
import 'package:birthday_app/constants/userAppModel.dart';
import 'package:birthday_app/services/dbServices.dart';
import 'package:birthday_app/utils/contacts_permission.dart';
import 'package:birthday_app/widgets/PopupMenuItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../constants/personModel.dart';
import '../widgets/contact_card.dart';

class Home extends StatelessWidget {
  Home({super.key});
  var _popupMenuItemIndex = 0;

  final FirebaseAuth fire = FirebaseAuth.instance;
  final String UserUID = FirebaseAuth.instance.currentUser!.uid;
  final Future<List<Person>> maListe =
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Birthday App'),
          actions: [
            PopupMenuButton(
              onSelected: (value) async {
                await _onMenuItemSelected(value as int);
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (ctx) => [
                _buildPopupMenuItem('Import contacts', 1),
              ],
            ),
          ],
        ),
        body: Column(
          children: [
            Text(
              'Contacts',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            Expanded(
                child: FutureBuilder(
              future: maListe,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final audioList = snapshot.data as List<Person>;
                  return ListView.builder(
                      itemCount: audioList.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                            key: ValueKey<int>(index),
                            onDismissed: (DismissDirection) async {
                              DatabaseService(uid: UserUID)
                                  .removeFile(audioList[index].personUrlImage);
                              DatabaseService(uid: UserUID)
                                  .removeMyPerson(audioList[index]);
                              audioList.removeAt(index);
                            },
                            background: Container(
                                color: Colors.red, child: Icon(Icons.delete)),
                            child: contact_card(
                              nom: audioList[index].nom,
                              prenom: audioList[index].prenom,
                              date: audioList[index].dateNaissance,
                              personUrlImage: audioList[index].personUrlImage,
                            ));
                      });
                } else if (snapshot.hasError) {
                  // handle error here
                  return Text('${snapshot.error}');
                } else {
                  return CircularProgressIndicator(); // displays while loading data
                }
              },
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: blueColor,
          foregroundColor: Colors.white,
          onPressed: () => {Navigator.pushNamed(context, '/thirdPage')},
        ));
  }

  PopupMenuItem _buildPopupMenuItem(String title, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        children: [
          Text(title),
        ],
      ),
    );
  }

  _onMenuItemSelected(int value) async {
    if (value == 1) {
      //TODO Contact import
      final PermissionStatus permissionStatus = await getPermission();
      print(permissionStatus);
      print('test');
      if (permissionStatus == PermissionStatus.granted) {
        //We can now access our contacts here
      }
    }
  }
}
