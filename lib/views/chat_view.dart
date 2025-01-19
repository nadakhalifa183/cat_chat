import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/background_decoration.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_bubble_friend.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatView extends StatelessWidget {
  ChatView({super.key});
  static String id = "ChatView";
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  TextEditingController controller = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xffE6BFD4),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 40,
                    ),
                    const Text(
                      "Cat Chat",
                      style: TextStyle(
                          color: Color(0xffA34564),
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    )
                  ],
                ),
              ),
              body: Container(
                decoration: backgroundDecoration(),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return messagesList[index].id == email
                                ? ChatBubble(
                                    message: messagesList[index],
                                  )
                                : ChatBubbleFriend(
                                    message: messagesList[index]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        controller: controller,
                        onSubmitted: (data) {
                          messages.add({
                            kMessage: data,
                            kCreatedAt: DateTime.now(),
                            kId: email
                          });
                          controller.clear();

                          _controller.animateTo(0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        decoration: InputDecoration(
                          filled: true,
                          focusColor: const Color(0xffF3F3F3),
                          fillColor: const Color(0xffF3F3F3),
                          hintText: "Enter Message",
                          hintStyle: const TextStyle(
                            color: Color(0xff767676),
                          ),
                          suffixIcon: const Icon(
                            Icons.send,
                            color: Color.fromARGB(255, 99, 75, 94),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 99, 75, 94),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 99, 75, 94),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 99, 75, 94),
                ),
              ),
            ));
          }
        });
  }
}
