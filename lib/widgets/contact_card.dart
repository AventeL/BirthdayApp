import 'package:flutter/material.dart';

class contact_card extends StatelessWidget {
  final String nom;
  final String prenom;
  final String date;

  contact_card({required this.nom, required this.prenom, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        color: Colors.amber,
        child: Column(children: [
          Row(
            children: [Icon(Icons.ac_unit_outlined)],
          ),
          Row(
            children: [
              Text(
                '$nom $prenom',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '$date',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
