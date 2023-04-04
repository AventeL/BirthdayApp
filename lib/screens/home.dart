import 'package:birthday_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/contact_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Birthday App')),
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
              child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    print(contacts[index]);
                    return contact_card(
                      nom: contacts[index]['nom'] ?? '',
                      prenom: contacts[index]['prenom'] ?? '',
                      date: contacts[index]['date'] ?? '',
                    );
                  }))
        ],
      ),
    );
  }
}
