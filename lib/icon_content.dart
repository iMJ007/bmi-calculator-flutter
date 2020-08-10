import 'package:flutter/material.dart';

const TextStyle textStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconContentWidget extends StatelessWidget {

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: textStyle,
        )
      ],
    );
  }

  IconContentWidget({@required this.icon,@required this.title});
}