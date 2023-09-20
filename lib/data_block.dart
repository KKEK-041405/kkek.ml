import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DataBlock extends StatefulWidget {
  const DataBlock({super.key});

  @override
  State<DataBlock> createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> {
  final Stream<DocumentSnapshot<Map<String, dynamic>>> _stream =
      FirebaseFirestore.instance.collection("KKEK").doc("Code").snapshots();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<DocumentSnapshot>(
        stream: _stream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("has some error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          List<Widget> list = [];
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          List<String> keys = data.keys.toList();
          for (var key in data.keys) {
            list.add(Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(data[key].toString())));
          }

          return ListView.builder(
              itemCount: keys.length,
              itemBuilder: (BuildContext context, index) {
                String key = keys[index];
                return ListTile(
                  trailing: Text(key),
                  title: Text(
                    data[key],
                    style: const TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  leading: Text("$index"),
                  onTap: () {
                    print("$index tapped");
                  },
                );
              });
        });
  }
}
