import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AppState {
  String? val;
  User? user;
  Error? error;
  String data = "{'HELLO': 'HELLO'}";

  //login function
  logIn(String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
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
    FirebaseFirestore.instance
        .collection("KKEK")
        .doc("Code")
        .update(<String, String?>{fieldid: data});
  }
}
