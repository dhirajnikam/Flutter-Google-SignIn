import 'package:flutter/material.dart';
import 'package:myapp/sign_In_pro.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: topPadding,
              ),
              Animated(),
              SizedBox(
                height: 40,
              ),
              Container(
                color: Colors.transparent,
                child: Text(
                  'Hii there!',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("Let's Get Started ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 50),
              Sign(),
              SizedBox(height: 30),
              Container(
                  child: Column(
                children: [
                  Text(
                    'From',
                    style: TextStyle(color: Colors.white,fontSize:15),
                  ),
                  Text('Dhiraj',
                      style: TextStyle(
                          color: Colors.deepPurple[400],
                          shadows: [Shadow(color: Colors.black, blurRadius: 1)],
                          fontSize: 20))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class Animated extends StatefulWidget {
  const Animated({Key? key}) : super(key: key);

  @override
  _AnimatedState createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation =
      (Tween(begin: Offset.zero, end: Offset(0, 0.08)))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset('assets/images/clouds.png'),
        SlideTransition(
            position: _animation,
            child: Image.asset(
              'assets/images/rocket_person.png',
              scale: 1.3,
            )),
      ],
    );
  }
}

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), 
      height: 80.0,
      width: 300.0,
      child: SignInButton(
      
        Buttons.Google,
        text: ("Sign up with Google"),
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.googleLogIn();
        },
        shape: RoundedRectangleBorder(
         borderRadius: new BorderRadius.circular(29)
        ),
      ),
    );
  }
}
