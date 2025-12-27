import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/firebase_helpe.dart';
import 'package:chat_app/helper/show_snak_bar.dart';

import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterationPage extends StatefulWidget {
  const RegisterationPage({super.key});
  static String id = 'registerPage';

  @override
  State<RegisterationPage> createState() => _RegisterationPageState();
}

class _RegisterationPageState extends State<RegisterationPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(KLogo),

                Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                SizedBox(width: double.infinity, height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'REGISTER',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return "this feild are requried";
                    }
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (!emailRegex.hasMatch(data)) {
                      return "not valid email";
                    }
                    return null;
                  },
                  onchange: (data) {
                    email = data;
                  },
                  textHint: 'Email',
                ),
                CustomTextFormField(
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return "this field is required";
                    }

                    final passwordRegex = RegExp(r'^(?=.*[a-zA-Z]).{8,}$');

                    if (!passwordRegex.hasMatch(data)) {
                      return "password must be at least 8 characters and contain at least 1 letter";
                    }

                    return null;
                  },
                  onchange: (data) {
                    password = data;
                  },
                  textHint: 'password',
                ),
                // CustomTextField(
                //   onchange: (data) {
                //     password = data;
                //   },
                //   textHint: 'Re-Password',
                // ),
                CustomButton(
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await FirebaseHelpe.register(
                          email: email,
                          password: password,
                        );
                        Navigator.pushNamed(context, ChatPage.id);
                        //   await registerUser();
                        // showSnakBar(context, 'sucess');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnakBar(
                            context,
                            'The password provided is too weak.',
                          );
                        } else if (e.code == 'email-already-in-use') {
                          showSnakBar(context, 'The account already exists.');
                        }
                      } catch (e) {
                        showSnakBar(context, 'fuck');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  title: 'Register',
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account?',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '  LOGIN',
                          style: TextStyle(color: Color(0xffC7EDE6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> registerUser() async {
  //   var auth = FirebaseAuth.instance;
  //   await auth.createUserWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );
  // }
}
