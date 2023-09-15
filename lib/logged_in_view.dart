import 'package:flutter/material.dart';
import 'package:kkek/app_state.dart';

class LoggedInView extends StatefulWidget {
  final AppState state;

  LoggedInView({super.key, required this.state});

  @override
  State<LoggedInView> createState() => _LoggedInViewState();
}

class _LoggedInViewState extends State<LoggedInView> {
  final datanamecontorller = TextEditingController();
  final docnamecontorller = TextEditingController();
  final feildnamecontorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final name = widget.state.user!.displayName ?? "no name";
    String notes = "hello";
    String e;

    return Scaffold(
      appBar: AppBar(
        title: const Text("KKEK"),
      ),
      body: Center(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logged in as $name"),
              Row(children: [
                Expanded(
                    flex: 1,
                    child: TextField(
                      decoration:
                          const InputDecoration(label: Text("DOC_NAME")),
                      controller: docnamecontorller,
                    )),
                Expanded(
                    flex: 1,
                    child: TextField(
                      decoration:
                          const InputDecoration(label: Text("Feild_Name")),
                      controller: feildnamecontorller,
                    ))
              ]),
              TextField(
                decoration: const InputDecoration(label: Text("data")),
                controller: datanamecontorller,
              ),
              TextButton(
                  autofocus: true,
                  onPressed: () => setState(() {
                        widget.state
                            .writetodatabase(
                                docnamecontorller.text,
                                feildnamecontorller.text,
                                datanamecontorller.text)
                            .then();
                      }),
                  child: const Text("ADD to database")),
              Text(datanamecontorller.text),
            ]),
      ),
    );
  }
}
