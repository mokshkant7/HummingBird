import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'login_screen.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<
        WelcomeScreen> // mixins are a way of reusing a class's code in multiple class hierarchies.
    with
        SingleTickerProviderStateMixin {
  AnimationController controller;
  //Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    //animation =
    //    ColorTween(begin: Colors.white, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.4,
              child: Image.asset(
                'images/Back3.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          child: Image.asset('images/HummingBirdLogo.png'),
                          height: 120.0,
                        ),
                      ),
                      //ColorizeAnimatedTextKit(
                      // text: ['HummingBird'],
                      //textStyle: TextStyle(
                      // fontSize: 40.0,
                      //fontWeight: FontWeight.w900,
                      //),
                      //colors: [
                      //Colors.teal,
                      // Colors.blue,
                      // Colors.blueAccent,
                      // Colors.green,
                      // Colors.lightGreenAccent,
                      // Colors.teal,
                      //],
                      //)
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  RoundedButton(
                    title: 'Log In',
                    colour: Color(0xFF69c78d),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                  RoundedButton(
                    title: 'Register',
                    colour: Color(0xFF5784E6),
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
