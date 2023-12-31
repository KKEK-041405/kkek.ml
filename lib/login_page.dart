import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
            onPressed: () async => await state
                    .logIn("komaleshwarakumarkonatham@gmail.com", "K0m@1.com")
                    .then((_) {
                  if (state.user != null) {
                    if (kDebugMode) {
                      print(state.user);
                    }
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ChatsPage(title: title, state: state)));
                  }
                }),
            child: const Text("Login"))
      ],
    ));
  }
}
