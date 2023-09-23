import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';
import 'package:kkek/data_block.dart';
import 'package:kkek/login_page.dart';

class ChatsPage extends StatelessWidget {
  final AppState state;
  final Text title;

  const ChatsPage({
    super.key,
    required this.title,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: title),
      body: content(),
    );
  }

  Widget content() {
    if (state.user == null) {
      return LoginForm(title: title, state: state);
    }

    if (state.user != null) {
      return Column(
        children: [
          Expanded(
            flex: 9,
            child: DataBlock(
              doc: "ChatX",
              state: state,
            ),
          ),
          Expanded(
            flex: 1,
            child: inputBox(),
          ),
        ],
      );
    }
    return const Placeholder();
  }

  Widget inputBox() {
    TextEditingController message = TextEditingController();
    return Center(
      child: Container(
        color: Colors.green,
        child: Center(
          child: Row(children: [
            Expanded(
                child: TextField(
              controller: message,
            )),
            TextButton(
                onPressed: () {
                  if (message.text != "") {
                    state.sendmessage(message.text.toString());
                    message.text = "";
                    state.scrollToBottom();
                  }
                },
                child: const Icon(Icons.send)),
          ]),
        ),
      ),
    );
  }
}
