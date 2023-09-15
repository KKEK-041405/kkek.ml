import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kkek/HomePage.dart';
import 'package:kkek/app_state.dart';
import 'package:kkek/firebase_options.dart';
import 'package:kkek/logout_view.dart';
import 'package:kkek/main1.dart';
import 'package:go_router/go_router.dart';

import 'logged_in_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8081);
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      // ignore: avoid_print
    }
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final state = AppState();
  MyApp({
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
      home: const HomePage(
        title: Text("KKEK"),
      ),
      // routerConfig: _router(),
    );
  }

  GoRouter _router() {
    return GoRouter(
      redirect: (context, routerState) => state.user == null ? '/login' : null,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, routerState) => LoggedInView(state: state),
        ),
        GoRoute(
          path: '/login',
          builder: (context, routerState) => LoggedOutView(state: state),
        ),
      ],
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Center(
              child: Text(widget.title),
            )),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1, // 20%
                child: MyPage(
                  title: "page1",
                  color: Colors.green,
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ));
  }
}

class MyPage extends StatefulWidget {
  const MyPage(
      {super.key,
      required this.title,
      required this.color,
      required this.icon});
  final String title;
  final Color color;
  final Icon icon;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();
  int sum = 0;
  int frival = 0;
  int secval = 0;
  String keyword = "add";
  String result = "0";
  @override
  void dispose() {
    mycontroller1.dispose();
    mycontroller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          TextField(
              controller: mycontroller1,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: ((value) => setState(() {
                    frival = vaidateInput(value);
                  }))),
          TextField(
              controller: mycontroller2,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: ((value) => setState(() {
                    secval = vaidateInput(value);
                  }))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  color: Colors.amber,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 1, child: Text("sum = ${frival + secval}")),
                        Expanded(
                            flex: 1,
                            child: Text("differ = ${frival - secval}")),
                        Expanded(
                            flex: 1,
                            child: Text("poduct = ${frival * secval}")),
                        Expanded(
                            flex: 1,
                            child: Text("divide = ${frival / secval}")),
                      ]),
                ),
                Container(
                  color: Colors.purpleAccent,
                  child: Row(
                    children: [Expanded(child: Text("$keyword  = $result"))],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () => {displayval("add")},
                            child: const Text("add"))),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () => {displayval("sub")},
                            child: const Text("sub"))),
                    Expanded(
                        flex: 1,
                        child: TextButton(
                            onPressed: () => {displayval("multi")},
                            child: const Text("multi"))),
                    Expanded(
                        child: TextButton(
                            onPressed: () => {displayval("divide")},
                            child: const Text("divide"))),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  displayval(String keyword) {
    String val = "0";
    if (keyword == "add") val = (frival + secval).toString();
    if (keyword == "sub") val = (frival - secval).toString();
    if (keyword == "multi") val = (frival * secval).toString();
    if (keyword == "divide") val = (frival / secval).toStringAsFixed(4);
    setState(() {
      this.keyword = keyword;
      result = val;
    });
  }
}

int vaidateInput(String value) {
  if (value == "") value = "0";
  value = (int.parse(value)).toString();
  return int.parse(value);
}
