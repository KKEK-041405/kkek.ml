import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';

class WritePage extends StatelessWidget {
  final title;
  TextEditingController field = TextEditingController();
  TextEditingController data = TextEditingController();
  WritePage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(label: Text("field")),
              controller: field,
            ),
            TextField(
              decoration: const InputDecoration(label: Text("DATA")),
              controller: data,
            ),
            ElevatedButton(
                onPressed: () =>
                    AppState().writetodatabase(field.text, data.text),
                child: const Text("Write")),
            ElevatedButton(
              child: const Text("GO to HomePage"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
