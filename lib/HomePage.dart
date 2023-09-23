import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';
import 'package:kkek/logged_in_view.dart';
import 'package:kkek/logout_view.dart';

import 'chats_page.dart';
import 'login_page.dart';
import 'read_page.dart';
import 'write_page.dart';

class HomePage extends StatelessWidget {
  final Text title;
  final AppState state;
  const HomePage({super.key, required this.title, required this.state});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: title,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WritePage(
                                title: title,
                              )))
                },
                child: const Text("WritePage"),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ReadPage(title: title, state: state))),
                child: const Text("ReadPage"),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChatsPage(title: title, state: state))),
                child: const Text("Chats"),
              ),
              const SnackBar(content: Text("data"))
            ],
          ),
        ));
  }
}
