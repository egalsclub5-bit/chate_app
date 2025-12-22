import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.textHint, this.onchange});
  String? textHint;
  Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'this feild are requried';
          }
        },
        onChanged: onchange,
        decoration: InputDecoration(
          hintText: textHint,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
