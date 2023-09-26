import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppState {
  String? val;
  User? user;
  Error? error;
  String data = "{'HELLO': 'HELLO'}";
  final ScrollController scrollcontroller = ScrollController();

  //login function
  logIn(String email, String password) async {
    var credential;
    try { credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException()
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
    // print("string vas $val");
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
}
