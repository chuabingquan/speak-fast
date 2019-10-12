import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: RaisedButton(
        child: const Text(
          'Play',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1.3,
            color: Colors.white
          ),
        ),
        onPressed: () {},
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
