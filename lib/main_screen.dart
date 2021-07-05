import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/sign_In_pro.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey.shade300, Colors.grey.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.logout();
                      },
                      child: Text('Logout')),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Profile',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(user.photoURL!),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Username',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                user.displayName!,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Email',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(user.email!),
            ],
          )),
    );
  }
}
