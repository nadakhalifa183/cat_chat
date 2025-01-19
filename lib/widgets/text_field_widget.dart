import 'package:flutter/material.dart';

class CustomFTextField extends StatelessWidget {
  CustomFTextField(
      {this.onChanged, this.hintText, super.key, this.obscureText = false});
  String? hintText;
  Function(String)? onChanged;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "this field is required";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xff767676), fontStyle: FontStyle.normal),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8E8D8D), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(100))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff8E8D8D), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
    );
  }
}
