import 'package:chat_app/cubits/cubit/login_cubit.dart';
import 'package:chat_app/cubits/cubit/register_cubit.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CatChat());
}

class CatChat extends StatelessWidget {
  const CatChat({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          RegisterView.id: (context) =>  RegisterView(),
          LoginView.id: (context) => LoginView(),
          ChatView.id: (context) => ChatView(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.id,
      ),
    );
  }
}
