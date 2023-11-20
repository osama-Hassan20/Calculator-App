import 'package:flutter/material.dart';


class InputOutputItem extends StatelessWidget {
  const InputOutputItem({
    super.key,
    required this.text,
    required this.color,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      width: double.infinity,

      //height: 100,
      child: Text(
        textAlign: textAlign,
        text,
        style:  TextStyle(
          color: color,
          fontSize: 28,
        ),
      ),
    );
  }
}