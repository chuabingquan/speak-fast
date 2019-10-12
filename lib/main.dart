import 'package:flutter/material.dart';

import './screens/play_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Speak Fast',
        home: PlayScreen(),
        theme: ThemeData(
          primaryColor: Colors.yellowAccent.shade700,
        ));
  }
}
