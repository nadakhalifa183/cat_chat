import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      clipBehavior: Clip.hardEdge,
      behavior: SnackBarBehavior.floating ,
       duration: const Duration(seconds: 3),
      //  margin: const EdgeInsets.all(22),
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    ));
  }