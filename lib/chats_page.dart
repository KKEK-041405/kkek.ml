import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';
import 'package:kkek/data_block.dart';
import 'package:kkek/login_page.dart';

class ChatsPage extends StatefulWidget {
  final AppState state;
  final Text title;
  ChatsPage({
    super.key,
    required this.title,
    required this.state,
  });

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  String chat = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: widget.title),
      body: content(),
    );
  }

  Widget content() {
    if (kDebugMode) {
      return Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: ListofChats(),
              )),
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                      flex: 9,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Expanded(flex: 1, child: ShowChats()),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                    ),
                  ),
                ],
              )),
        ],
      );
    }

    if (widget.state.user == null) {
      return LoginForm(title: widget.title, state: widget.state);
    }

    if (widget.state.user != null) {
      return Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: ListofChats(),
              )),
          // Expanded(
          //     flex: 8,
          //     child: Column(
          //       children: [
          //         Expanded(
          //             flex: 9,
          //             child: Container(
          //               width: double.infinity,
          //               decoration: BoxDecoration(border: Border.all()),
          //               child: Expanded(flex: 1, child: ShowChats()),
          //             )),
          //         Expanded(
          //           flex: 1,
          //           child: Container(
          //             decoration: BoxDecoration(border: Border.all()),
          //           ),
          //         ),
          //       ],
          //     )),
        ],
      );
      // Column(
      //   children: [
      //     Expanded(
      //       flex: 9,
      //       child: DataBlock(
      //         doc: "ChatX",
      //         state: widget.state,
      //       ),
      //     ),
      //     Expanded(
      //       flex: 1,
      //       child: inputBox(),
      //     ),
      //   ],
      // );
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
                    widget.state.sendmessage(message.text.toString());
                    message.text = "";
                    widget.state.scrollToBottom();
                  }
                },
                child: const Icon(Icons.send)),
          ]),
        ),
      ),
    );
  }

  Widget ListofChats() {
    Map<String, dynamic> elements;
    elements = {
      "1": "a",
      "2": "b",
      "3": "c",
      "4": "d",
      "5": "e",
      "6": "f",
    };
    List keys = (elements.keys.toList());
    keys.sort();
    if (!kDebugMode) {
      widget.state.getChats();
      elements = widget.state.chats!;
      keys = widget.state.chats!.keys.toList();
      keys.sort();
    }
    print(elements);
    return ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              setState(() {
                chat = elements[keys[index]];
              });
              if (kDebugMode) {}
            },
            title: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Text(elements[index]),
            ),
          );
        });
  }

  Widget ShowChats() {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all()),
                child: Center(child: Text(chat)))),
        Expanded(
          flex: 14,
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all()),
              child: Text("sdkfjl")),
        ),
      ],
    );
  }
}
