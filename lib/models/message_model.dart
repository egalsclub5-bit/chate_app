import 'package:chat_app/constans.dart';

class MessageModel {
  final String message;

  MessageModel(this.message);
  factory MessageModel.fromJason( jasonData) {
    return MessageModel(jasonData[KPmessage]);
  }
}
