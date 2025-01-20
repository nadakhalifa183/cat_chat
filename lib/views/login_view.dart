// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/cubits/cubit/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/background_decoration.dart';
import 'package:chat_app/helper/show_snackBar.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  String? email;

  String? password;
  static String id = "LoginView";

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginLoading){
          isLoading = true ;
        }else if(state is LoginSuccess){
     Navigator.pushNamed(context,ChatView.id);
       isLoading = false ;
        }else if(state is LoginFailure){
          showSnackBar(context, state.errMessage);
            isLoading = false ;
        }
      },
      builder:(context , state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: Container(
            decoration: backgroundDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Color(0xff303030),
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          kLogo,
                          height: 80,
                        ),
                        const Text(
                          "Cat Chat",
                          style: TextStyle(
                              color: Color(0xffA34564),
                              // fontFamily: "Public Sans",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Email",
                          style:
                              TextStyle(color: Color(0xffAA5E77), fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'example@gmail.com',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Password",
                          style:
                              TextStyle(color: Color(0xffAA5E77), fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFTextField(
                      obscureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: "********",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).signInUser(email: email!, password: password!);
                          // isLoading = true;

                          // try {
                          //   await signInUser();
                          //   Navigator.pushNamed(context, ChatView.id,
                          //       arguments: email);
                          // } on FirebaseAuthException catch (e) {
                          //   if (e.code == 'user-not-found') {
                          //     showSnackBar(context, "User not found");
                          //   } else if (e.code == 'wrong-password') {
                          //     showSnackBar(context,
                          //         'Wrong password provided for that user.');
                          //   }
                          // }
                          // isLoading = false;
                        }
                      },
                      buttonName: "Sign In",
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "don't have an account ? ",
                          style:
                              TextStyle(color: Color(0xff618AB7), fontSize: 18),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterView.id);
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  color: Color(0xff303030),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                    //  const Spacer(flex:2,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> signInUser() async {
  //   UserCredential user = await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: email!, password: password!);
  // }
}
