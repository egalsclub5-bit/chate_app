import 'package:chat_app/constans.dart';
import 'package:chat_app/helper/firebase_helpe.dart';
import 'package:chat_app/helper/show_snak_bar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/registeration_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  static String id = 'LoginPage';
  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
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
                        'Sign In',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                CustomTextFormField(
                  textHint: 'Email',
                  onchange: (data) {
                    email = data;
                  },
                ),
                CustomTextFormField(
                  textHint: 'password',
                  onchange: (data) {
                    password = data;
                  },
                ),
                CustomButton(
                  title: 'Sign IN',
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await FirebaseHelpe.login(
                          email: email,
                          password: password,
                        );
                        Navigator.pushNamed(context, ChatPage.id,arguments: email);

                        showSnakBar(context, 'تم تسجيل الدخول بنجاح');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'invalid-credential' ||
                            e.code == 'invalid-login-credentials') {
                          showSnakBar(
                            context,
                            'Email or password is incorrect',
                          );
                        } else if (e.code == 'invalid-email') {
                          showSnakBar(context, 'Invalid email format');
                        } else if (e.code == 'too-many-requests') {
                          showSnakBar(
                            context,
                            'Too many attempts, try again later',
                          );
                        } else {
                          showSnakBar(context, 'Auth error: ${e.code}');
                        }
                      } catch (e) {
                        showSnakBar(context, 'there was an erroe');
                        print('errro 321354546545   ${e.toString()}');
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'dont\'t have an account?',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterationPage.id);
                        },
                        child: Text(
                          '  Register',
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
}
