import 'package:birthday_app/screens/addperson.dart';
import 'package:birthday_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:birthday_app/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: scaffolBackgeoundColor,
          appBarTheme: AppBarTheme(color: blueColor),
        ),
        routes: {
          '/': (context) => Login(),
          '/secondPage': (context) => Home(),
          '/thirdPage': (context) => MySecondPage(),
        },
        initialRoute: '/');
  }
}
