import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/firebase_helpe.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage();
  // final String documentId;
  TextEditingController controller = TextEditingController();
  static String id = 'ChatPage';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: message.doc('kp5JCyRSKyFLuLGOPDhK').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            print('glkjgjjgjg ${snapshot.data}');
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
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                      ),
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
                        return ChatBuble();
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
