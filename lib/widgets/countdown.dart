import 'package:flutter/material.dart';

class Countdown extends StatelessWidget {
  const Countdown({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '15',
          style: TextStyle(
            fontSize: 80,
            color: Colors.black87
          ),
        ),
      ),
    );
  }
}
