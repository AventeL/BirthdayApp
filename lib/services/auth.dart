import 'package:birthday_app/constants/userAppModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future SignInWIthEmail(String email, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    return userFromFirebaseUser(user!);
  }

  AppUser? userFromFirebaseUser(User user) {
    print(user.toString());
    return user != null
        ? AppUser(nom: "", uid: user.uid, PersonList: [])
        : null;
  }
}
