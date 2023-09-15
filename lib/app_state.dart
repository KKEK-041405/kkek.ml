import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AppState {
  User? user;
  late Error error;
  late Map<String, dynamic> data;
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

  void readfromdb() {
    FirebaseFirestore.instance.collection("KKEK").doc("Code").get().then(
          (DocumentSnapshot doc) => {data = doc.data() as Map<String, dynamic>},
        );
  }

  writetodatabase(String fieldid, String data) {
    FirebaseFirestore.instance
        .collection("KKEK")
        .doc("Code")
        .update(<String, String?>{fieldid: data});
  }
}
