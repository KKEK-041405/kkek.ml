import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kkek/app_state.dart';

class LoggedOutView extends StatelessWidget {
  final AppState state;
  const LoggedOutView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: const Text("KKEK")),
      body: Center(
          child: Column(
        children: [
          const Text("Please login"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async => await state
                  .logIn('komaleshwarakumarkonatham@gmail.com', 'K0m@1.com')
                  .then((_) {
                if (state.user != null) {
                  if (kDebugMode) {
                    print(state.user);
                  }
                  context.go('/');
                } else {
                  context.go('/');
                }
              }),
              child: const Text('Log In'),
            ),
          )
        ],
      )),
    );
  }
}
