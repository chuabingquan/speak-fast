import 'package:flutter/material.dart';

import '../widgets/text_content.dart';
import '../widgets/countdown.dart';
import '../widgets/play_button.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "speak",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                // fontStyle: FontStyle.italic,
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
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextContent(),
            Countdown(),
            PlayButton(),
          ],
        ),
      ),
    );
  }
}
