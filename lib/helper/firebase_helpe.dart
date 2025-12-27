import 'package:chat_app/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

CollectionReference message = FirebaseFirestore.instance.collection(
  KpmessagesCollection,
);

class FirebaseHelpe {
  static Stream<QuerySnapshot<Object?>> getMessages() {
    return message.orderBy("date", descending: true).snapshots();
  }

  static Future<UserCredential> login({String? email, String? password}) async {
    return await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  static bool get isLogin => auth.currentUser != null;
  static String get email => auth.currentUser?.email ?? "";

  static Future<UserCredential> register({
    String? email,
    String? password,
  }) async {
    return await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  static Future<void> logout() async {
    return await auth.signOut();
  }

  static Future<void> addUser({
    required String sendmessage,
    required String email,
    required DateTime date,
  }) {
    return message.add({'message': sendmessage, 'id': email, 'date': date});
  }
}
