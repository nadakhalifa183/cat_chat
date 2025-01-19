import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubbleFriend extends StatelessWidget {
  const ChatBubbleFriend({super.key, required this.message});
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        // height: 65,
        decoration: const BoxDecoration(
            color: Color(0xffF3F3F3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26),
              topRight: Radius.circular(22),
              bottomLeft: Radius.circular(26),
            )),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            message.message,
            style: const TextStyle(color: Color(0xff303030)),
          ),
        ),
      ),
    );
  }
}
