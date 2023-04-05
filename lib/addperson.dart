import 'package:flutter/material.dart';
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
            ClipOval(
              child: Image(
                image: AssetImage('lib/images/photo.jpg'),
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              textAlign: TextAlign.left,
              enableSuggestions: false,
              autocorrect: false,
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
              onPressed: () async {},
              child: const Text('Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}
