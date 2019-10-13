import 'package:flutter/material.dart';
import 'package:diff_match_patch/diff_match_patch.dart';

import '../widgets/score_card.dart';
import '../widgets/play_button.dart';
import './play_screen.dart';

class CompleteScreen extends StatelessWidget {
  static const routeName = '/complete';

  @override
  Widget build(BuildContext context) {
    final session =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final readingContent = session['reading'].content as String;
    final transcript = session['transcript'] as String;
    var diffs = DiffMatchPatch().diff(readingContent, transcript);
    final score = (diffs.fold(0, (acc, diff) {
              if (diff.operation == 0)
                return acc + 1;
              else
                return acc;
            }) /
            diffs.length *
            100)
        .ceil();
    final next = session['next'] as Function;

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
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScoreCard(
              height: MediaQuery.of(context).size.height * 0.3,
              score: score,
            ),
            SizedBox(
              height: 25,
            ),
            PlayButton('Go Faster!', () {
              next();
              Navigator.of(context).pushReplacementNamed(PlayScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
}
