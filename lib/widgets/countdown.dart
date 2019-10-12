import 'package:flutter/material.dart';

class Countdown extends StatelessWidget {
  final int _countdown;

  const Countdown(this._countdown);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          _countdown == null ? "" : _countdown.toString(),
          style: TextStyle(
            fontSize: 80,
            color: Colors.black87
          ),
        ),
      ),
    );
  }
}
