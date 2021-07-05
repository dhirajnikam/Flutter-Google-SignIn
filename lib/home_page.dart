import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/login_page.dart';
import 'package:myapp/main_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return MainScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return MyApp();
            }
          },
        ),
      );
}
