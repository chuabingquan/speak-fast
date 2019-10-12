import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  final String text1 =
      "To thine own self be true, and it must follow, as the night the day, thou canst not then be false to any man.";
  final String text2 =
      "Gucci gang, Gucci gang, Gucci gang, Gucci gang (Gucci gang) Gucci gang, Gucci gang, Gucci gang (Gucci gang)";
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
            text1,
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
