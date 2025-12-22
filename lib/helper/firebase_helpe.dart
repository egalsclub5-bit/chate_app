import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class FirebaseHelpe {
  static Future<UserCredential> login({String? email, String? password}) async {
    return await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  static Future<UserCredential> register({
    String? email,
    String? password,
  }) async {
    return await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
