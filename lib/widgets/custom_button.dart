import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.ontap,  required this.title});
  String title;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(title, style: TextStyle(fontFamily: 'Pacifico')),
          ),
        ),
      ),
    );
  }
}
