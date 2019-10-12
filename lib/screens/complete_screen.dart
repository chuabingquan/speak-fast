import 'package:flutter/material.dart';

class CompleteScreen extends StatelessWidget {
  static const routeName = '/complete';

  @override
  Widget build(BuildContext context) {
    final userTranscript = ModalRoute.of(context).settings.arguments as String;
    print("Captured: $userTranscript");
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "speak",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 23,
                letterSpacing: 0.8,
              ),
            ),
            Text(
              "fast",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 23,
                letterSpacing: 3,
              ),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(),
    );
  }
}