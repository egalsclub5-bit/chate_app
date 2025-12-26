import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/firebase_helpe.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage();
  final Scontroller = ScrollController();
  // final String documentId;
  TextEditingController controller = TextEditingController();
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)?.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: message.snapshots(),
      builder: (context, snapshot) {
        List<MessageModel> messageList = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messageList.add(MessageModel.fromJason(snapshot.data!.docs[i]));
        }
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
                  controller: Scontroller,
                  reverse: true,
                  itemCount: messageList.length,
                  itemBuilder: (BuildContext, Index) {
                    return ChatBuble(message: messageList[Index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    FirebaseHelpe.addUser(data);
                    controller.clear();
                    _scrollDown() {
                      Scontroller.animateTo(
                        Scontroller.position.maxScrollExtent,
                        duration: Duration(seconds: 2),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'send massege',
                    hintStyle: TextStyle(color: KPrimaryColor),
                    suffixIcon: Icon(Icons.send, color: KPrimaryColor),
                    focusColor: KPrimaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: KPrimaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
