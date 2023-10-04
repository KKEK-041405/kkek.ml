import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';

class DataBlock extends StatefulWidget {
  final String? doc;
  final AppState state;
  const DataBlock({super.key, required this.doc, required this.state});

  @override
  State<DataBlock> createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> {
  final _collection = FirebaseFirestore.instance.collection("KKEK");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var _stream = _collection.doc(widget.doc).snapshots();
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
              controller: widget.state.scrollcontroller,
              itemCount: keys.length,
              itemBuilder: (BuildContext context, int index) {
                String key = keys[index];
                if (widget.doc == "ChatX") {
                  key = index.toString();
                }
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
