import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final Function _onPressedHandler;
  final String buttonText;
  
  const PlayButton(this.buttonText, this._onPressedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: RaisedButton(
        child: Text(
          buttonText,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1.3,
            color: Colors.white
          ),
        ),
        onPressed: _onPressedHandler,
        elevation: 0.0,
        color: Colors.yellow.shade900,
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            6.0,
          ),
        ),
      ),
    );
  }
}
