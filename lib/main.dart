import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kkek/main1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KKEK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "HELLO"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Center(
            child: Text(widget.title),
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            "$_counter is second line of second dummy text",
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: "increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}
