import 'package:flutter/material.dart';

import './screens/play_screen.dart';
import './screens/complete_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speak Fast',
      theme: ThemeData(
        primaryColor: Colors.yellowAccent.shade700,
      ),
      routes: {
        PlayScreen.routeName: (ctx) => PlayScreen(),
        CompleteScreen.routeName: (ctx) => CompleteScreen(),
      },
    );
  }
}
