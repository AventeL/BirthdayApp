import 'package:birthday_app/screens/home.dart';
import 'package:flutter/material.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Birthday App",
      theme: ThemeData(
        scaffoldBackgroundColor: scaffolBackgeoundColor,
        appBarTheme: AppBarTheme(color: blueColor),
      ),
      home: const Home(),
    );
  }
}
