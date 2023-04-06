import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:birthday_app/services/auth.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final AuthenticationService auth = AuthenticationService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                width: 200,
                height: 150,
                image: AssetImage('lib/images/herbe.jpg'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                textAlign: TextAlign.center,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.mail, color: Colors.blue),
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
                textAlign: TextAlign.center,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
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
                  final result =
                      await auth.SignInWIthEmail("test@test.test", "test1234");
                  if (result == null) {
                    print("Ici c'est l'erreur t'as capté");
                  } else {
                    Navigator.pushNamed(context, '/secondPage');
                  }
                },
                child: const Text('Login'),
              ),
            ],
          )),
    );
  }
}
