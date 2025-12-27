import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/firebase_helpe.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/pages/login_pages.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage();
  final scontroller = ScrollController();
  // final String documentId;
  TextEditingController controller = TextEditingController();
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    String email = FirebaseHelpe.email;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseHelpe.getMessages(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
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
                  Spacer(),
                  Image.asset(width: 70, KLogo),
                  Text(
                    'Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () async {
                      await FirebaseHelpe.logout();
                      Navigator.pushNamed(context, LoginPages.id);
                    },
                    icon: Icon(Icons.logout, color: Colors.white),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: scontroller,
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
                    onSubmitted: (data) => sendMessage(
                      message: controller.text.trim(),
                      email: email,
                    ),
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'send massege',
                      hintStyle: TextStyle(color: KPrimaryColor),
                      suffixIcon: IconButton(
                        onPressed: () {
                          sendMessage(
                            email: email,
                            message: controller.text.trim(),
                          );
                        },
                        icon: Icon(Icons.send, color: KPrimaryColor),
                      ),
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
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }

  _scrollDown() {
    scontroller.jumpTo(
      scontroller.position.minScrollExtent,
      // duration: Duration(seconds: 2),
      // curve: Curves.easeIn,
    );
  }

  sendMessage({required String message, required String email}) async {
    if (controller.text.trim() != "") {
      controller.clear();
      await FirebaseHelpe.addUser(
        sendmessage: message,
        email: email,
        date: DateTime.now(),
      );
      _scrollDown();
    }
  }
}
