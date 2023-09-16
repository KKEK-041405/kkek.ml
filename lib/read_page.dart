import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';

class ReadPage extends StatefulWidget {
  ReadPage({super.key, required this.title});
  final Text title;

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: widget.title),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              AppState().readfromdb();
            },
            child: const Text("Read"),
          ),
          const Text("This is Read Page"),
          Text(AppState().data.toString()),
        ],
      )),
    );
  }
}
