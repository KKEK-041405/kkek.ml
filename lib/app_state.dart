import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AppState {
  User? user;
  late Error error;
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

  void readfromdb() {}
  writetodatabase(String? docid, String fieldid, String data) {
    FirebaseFirestore.instance
        .collection("KKEK")
        .doc(docid)
        .update(<String, String?>{fieldid: data});
  }
}
