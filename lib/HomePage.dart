import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';
import 'package:kkek/logged_in_view.dart';
import 'package:kkek/logout_view.dart';

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
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ReadPage(title: title, state: state))),
                child: const Text("ReadPage"),
              ),
            ],
          ),
        ));
  }
}
