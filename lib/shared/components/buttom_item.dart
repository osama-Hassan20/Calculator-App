import 'package:flutter/material.dart';

class buttomItem extends StatelessWidget {
  const buttomItem({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.textString,
    required this.onTap,
  });

  final Color textColor;
  final Color backgroundColor;
  final String textString;
  final VoidCallback onTap;

  static late double width;
  static late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          textString,
          style: TextStyle(
            fontSize: 28,
            color: textColor,
          ),
        )),
      ),
    );
  }
}
