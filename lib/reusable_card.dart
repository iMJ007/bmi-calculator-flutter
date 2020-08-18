import 'package:flutter/material.dart';
class ReusableWidget extends StatelessWidget {
  ReusableWidget({@required this.color, this.cardChild, this.onClicked});

  final Color color;
  final Widget cardChild;
  final Function onClicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
