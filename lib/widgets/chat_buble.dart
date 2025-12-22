import 'package:chat_app/constans.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: KPrimaryColor,
        ),
        child: Text(
          'wlecme to chat app can i help you',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
