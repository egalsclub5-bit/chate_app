import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/firebase_helpe.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.message});
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    final bool isMe = (message.email == FirebaseHelpe.email);
    return Align(
      alignment: isMe
          ? AlignmentGeometry.centerLeft
          : AlignmentGeometry.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: isMe ? Radius.circular(32) : Radius.circular(0),
            bottomLeft: !isMe ? Radius.circular(32) : Radius.circular(0),
          ),
          color: isMe ? KPrimaryColor : KPrimaryColor.withOpacity(.65),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.message, style: TextStyle(color: Colors.white)),
            Text(
              isToday(message.createdAt)
                  ? formatTodayDate(message.createdAt)
                  : formatDate(message.createdAt),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  bool isToday(DateTime messageTime) {
    final now = DateTime.now();
    final isToday =
        (messageTime.year == now.year) &&
        (messageTime.month == now.month) &&
        (messageTime.day == now.day);
    return isToday;
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat('dd-MM-yyyy hh:mm');
    final amPm = DateFormat('a').format(date); // AM / PM

    return '${formatter.format(date)}${amPm[0]}m';
  }

  String formatTodayDate(DateTime date) {
    final formatter = DateFormat('hh:mm');
    final amPm = DateFormat('a').format(date); // AM / PM

    return '${formatter.format(date)}${amPm[0]}m';
  }
}
