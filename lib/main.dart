import 'package:flutter/material.dart';

import './screens/play_screen.dart';
import './screens/complete_screen.dart';
import './data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var counter = 0;

  void _nextRound() {
    if ((counter + 1) >= READINGS.length) {
      setState(() {
        counter = 0;
      });
    } else {
      setState(() {
        counter += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speak Fast',
      theme: ThemeData(
        primaryColor: Colors.yellowAccent.shade700,
      ),
      routes: {
        PlayScreen.routeName: (ctx) => PlayScreen(READINGS[counter], _nextRound),
        CompleteScreen.routeName: (ctx) => CompleteScreen(),
      },
    );
  }
}
