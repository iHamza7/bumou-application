import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String text;
  const BoldText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
    );
  }
}
