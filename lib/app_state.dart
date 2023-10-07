import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kkek/login_page.dart';

class AppState {
  String? val;
  User? user;
  Error? error;
  String data = "{'HELLO': 'HELLO'}";
  Map<String, dynamic>? chats;
  final ScrollController scrollcontroller = ScrollController();

  String chat = "";

  //login function
  logIn(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    // .then((value) => print(value));
    if (credential.user != null) {
      user = credential.user!;
    } else {
      if (kDebugMode) {
        print("not user");
      }
    }
  }

  //fun to read data from db
  readfromdb() async {
    final docs =
        await FirebaseFirestore.instance.collection("KKEK").doc("Code").get();
    if (docs.data() != null) {
      val = docs.data().toString();
    }
  }

  // final docsref = FirebaseFirestore.instance
  //     .collection("KKEK")
  //     .doc("Code")
  //     .snapshots()
  //     .listen((event) {
  //   val = event.data().toString();
  //   print("event data = ${event.data()}");
  // });

  //fun to write in db
  writetodatabase(String fieldid, String data) async {
    await FirebaseFirestore.instance
        .collection("KKEK")
        .doc("ChatX")
        .update(<String, String?>{fieldid: data});
  }

  sendmessage(String text) async {
    var doc = FirebaseFirestore.instance.collection("KKEK").doc("ChatX");
    print("doc getted");

    var num = ((await doc.get()).data() as Map<String, dynamic>).length;
    print("numgetted");
    await doc.update(<String, dynamic>{num.toString(): text.toString()});
  }

  scrollToBottom() async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollcontroller.animateTo(scrollcontroller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn);
    });
  }

  void getChats() async {
    final chats = await FirebaseFirestore.instance
        .collection("KKEK")
        .doc("ChatX")
        .collection((user?.email).toString())
        .doc("Chats")
        .get();
    this.chats = chats.data();
  }
}
