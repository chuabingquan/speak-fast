import 'package:flutter/material.dart';

import '../models/reading.dart';

class TextContent extends StatelessWidget {
  final Reading reading;

  TextContent(this.reading);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      // height: MediaQuery.of(context).size.height * 0.4,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ),
        ),
        margin: EdgeInsets.all(0.0),
        // padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Text(
            this.reading.content,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
