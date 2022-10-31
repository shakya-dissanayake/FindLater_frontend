import 'package:flutter/material.dart';

class SemiBoldText extends StatelessWidget {
  final String text;
  final double? size;
  final TextOverflow? overflow;

  const SemiBoldText(
      {Key? key,
      required this.text,
      this.size = 14,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: size),
    );
  }
}
