import 'package:birthday_app/constants/constants.dart';
import 'package:birthday_app/widgets/PopupMenuItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/contact_card.dart';

class Home extends StatelessWidget {
  Home({super.key});
  var _popupMenuItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Birthday App'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              //_onMenuItemSelected(value as int);
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: blueColor,
        foregroundColor: Colors.white,
        onPressed: () => {},
      ),
    );
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

  /*_onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == 1) {
      //TODO Contact import
    }
  }*/
}
