import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final double height;
  final int score;

  ScoreCard({this.height = 0.0, this.score = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.height,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Great job, you're a speed demon!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent.shade700,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent.shade700,
                          size: 50,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellowAccent.shade700,
                          size: 50,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '+$score points',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
