import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference message = FirebaseFirestore.instance.collection('message');

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

  static Future<void> addUser(sendmessage) {
    return message.add({'message': sendmessage});
  }
}
