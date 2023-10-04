import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkek/app_state.dart';
import 'package:kkek/chats_page.dart';

class LoginForm extends StatelessWidget {
  final AppState state;
  final Text title;
  const LoginForm({super.key, required this.state, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Column(
      children: [
        const Text("THis is login Page"),
        const SizedBox(height: 8.0),
        ElevatedButton(
            onPressed: () {
              if (!kDebugMode) {
                state.logIn("komaleshwarakumarkonatham@gmail.com", "K0m@1.com");
              }
            },
            child: const Text("Login"))
      ],
    ));
  }
}

class SignInPage extends StatelessWidget {
  final Text title;
  final AppState state;
  const SignInPage({super.key, required this.state, required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: title),
      body: const Placeholder(
        color: Colors.amber,
      ),
    );
  }
}
