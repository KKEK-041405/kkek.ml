import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';

import 'data_block.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key, required this.title, required this.state});
  final Text title;
  final AppState state;
  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  String? datab;
  String text = "This is Read Page";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: widget.title),
      body: DataBlock(
        doc: "Code",
        state: widget.state,
      ),
    );
  }
}
