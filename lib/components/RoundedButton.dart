import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.colour, this.title, @required this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour, //Colors.lightGreenAccent[700]
        borderRadius: BorderRadius.circular(20.0),
        child: MaterialButton(
          onPressed: onPressed,
          //Go to login screen.
          //Navigator.pushNamed(context, LoginScreen.id);
          minWidth: 200.0,
          height: 50.0,
          child: Text(
            title, //'Log In'
          ),
        ),
      ),
    );
  }
}
