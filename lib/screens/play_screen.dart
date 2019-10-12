import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../widgets/text_content.dart';
import '../widgets/countdown.dart';
import '../widgets/play_button.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Timer _timer;
  bool _startGame = false;
  int _countdown = 15;

  void startTimer() {
    const oneSecond = const Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSecond,
        (Timer timer) => setState(() {
              if (_countdown < 1)
                timer.cancel();
              else
                _countdown -= 1;
            }));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
            Countdown(_countdown),
            _startGame
                ? SizedBox(
                    height: 25,
                  )
                : PlayButton(() {
                    setState(() {
                      _startGame = true;
                    });
                    startTimer();
                  }),
          ],
        ),
      ),
    );
  }
}
