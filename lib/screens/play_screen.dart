import 'dart:async';

import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../widgets/text_content.dart';
import '../widgets/countdown.dart';
import '../widgets/play_button.dart';
import './complete_screen.dart';

class PlayScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  Timer _timer;
  bool _startGame = false;
  int _countdown = 15;
  SpeechRecognition _speechRecognition;
  bool _isAvailable = false;
  bool _isListening = false;
  String _resultText = "";

  @override
  void initState() {
    super.initState();
    initSpeechRecognizer();
  }

  void initSpeechRecognizer() {
    _speechRecognition = SpeechRecognition();
    _speechRecognition.setAvailabilityHandler(
        (result) => setState(() => _isAvailable = true));
    _speechRecognition.setRecognitionStartedHandler(
        () => setState(() => _isListening = true));
    _speechRecognition.setRecognitionResultHandler(
        (speech) => setState(() => _resultText = speech));
    _speechRecognition.setRecognitionCompleteHandler(
        () => setState(() => _isListening = false));
    _speechRecognition
        .activate()
        .then((result) => setState(() => _isAvailable = result));
  }

  void _stopListening() {
    if (_isListening) {
      _speechRecognition.stop().then((result) {
        setState(() {
          _isListening = result;
          _startGame = false;
        });
        String userTranscript = ""+_resultText;
        _resultText = "";
        Navigator.of(context)
            .pushReplacementNamed(CompleteScreen.routeName, arguments: userTranscript);
      });
    }
  }

  void startTimer(Function next) {
    const oneSecond = const Duration(seconds: 1);
    _timer = Timer.periodic(
        oneSecond,
        (Timer timer) => setState(() {
              if (_countdown < 1) {
                timer.cancel();
                next();
              } else
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
                    startTimer(_stopListening);
                    if (_isAvailable && !_isListening) {
                      _speechRecognition
                          .listen(locale: "en_US")
                          .then((result) => print('$result'));
                    }
                  }),
          ],
        ),
      ),
    );
  }
}
