import 'package:chat_app/constans.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: KPrimaryColor,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(width: 70, KLogo),
            Text(
              'Chat',
              style: TextStyle(color: Colors.white, fontFamily: 'Pacifico'),
            ),
          ],
        ),

        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext, Index) {
                //
                return ChatBuble();
              },
            ),
          ),
        ],
      ),
    );
  }
}
