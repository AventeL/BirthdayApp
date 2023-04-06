import 'dart:io';

import 'package:birthday_app/constants/personModel.dart';
import 'package:birthday_app/services/dbServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MySecondPage extends StatelessWidget {
  const MySecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ajouter une persone',
      home: addPerson(),
    );
  }
}

class addPerson extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _addperson();
  }
}

class _addperson extends State<addPerson> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController surnameFieldController = TextEditingController();
  late File myFile;

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ajouter une personne'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('lib/images/herbe.jpg'),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 20.0,
                  child: InkWell(
                    onTap: () async {
                      XFile? pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      myFile = File(pickedFile!.path);
                      if (myFile != null) {
                        myFile = File(pickedFile.path);
                      } else {
                        myFile = File('lib/images/herbe.jpg');
                      }
                    },
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              textAlign: TextAlign.left,
              enableSuggestions: false,
              autocorrect: false,
              controller: nameFieldController,
              decoration: InputDecoration(
                hintText: 'Nom',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.left,
              enableSuggestions: false,
              autocorrect: false,
              controller: surnameFieldController,
              decoration: InputDecoration(
                hintText: 'Prénom',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                filled: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              textAlign: TextAlign.left,
              enableSuggestions: false,
              autocorrect: false,
              controller: dateInput,
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: 'Date d\'anniversaire',
                filled: true,
              ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  setState(() {
                    dateInput.text = formattedDate;
                  });
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  side: const BorderSide(
                    width: 2.0,
                    color: Colors.black38,
                  ),
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 100.0, right: 100.0)),
              onPressed: () async {

              },
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
