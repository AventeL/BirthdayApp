import 'package:birthday_app/constants/constants.dart';
import 'package:flutter/material.dart';

class contact_card extends StatelessWidget {
  final String nom;
  final String prenom;
  final DateTime date;

  contact_card({required this.nom, required this.prenom, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blueColor,
                ),
                child: Icon(
                  Icons.person_outline_sharp,
                  color: Colors.white,
                  size: 45,
                ),
              )
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '$nom $prenom',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '$date',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
