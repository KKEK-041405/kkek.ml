import 'package:flutter/material.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key, required this.title});
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
      body: const Text("This is Read Page"),
    );
  }
}
