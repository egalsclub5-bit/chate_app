import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/scholar.png'),

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
            CustomTextFormField(textHint: 'Email'),
            CustomTextFormField(textHint: 'password'),
            CustomButton(title: ''),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'dont\'t have an account?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    '  Register',
                    style: TextStyle(color: Color(0xffC7EDE6)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
