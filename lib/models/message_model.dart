import 'package:chat_app/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String email;
  final DateTime createdAt;

  MessageModel(this.message, this.email, this.createdAt);
  factory MessageModel.fromJason(jasonData) {
    return MessageModel(
      jasonData[KPmessage],
      jasonData[KPemail],
      (jasonData[KPtime] as Timestamp).toDate(),
    );
    // return MessageModel(jasonData[KPmessage], jasonData[KPtime]);
  }
}
