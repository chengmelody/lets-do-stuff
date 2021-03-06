import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.text, this. colour, this.onPress});
  final String text;
  final Function onPress;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: colour,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text, style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}