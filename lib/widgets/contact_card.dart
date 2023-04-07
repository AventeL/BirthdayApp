import 'package:birthday_app/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class contact_card extends StatelessWidget {
  final String nom;
  final String prenom;
  final DateTime date;
  final String personUrlImage;

  contact_card(
      {required this.nom,
      required this.prenom,
      required this.date,
      required this.personUrlImage});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 80,
      color: Colors.white,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: personUrlImage,
                  placeholder: (BuildContext context, String url) =>
                      const CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 156,
                    ),
                  ),
                  errorWidget:
                      (BuildContext context, String url, dynamic error) =>
                          const CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 156,
                    ),
                  ),
                ),
              ),
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
