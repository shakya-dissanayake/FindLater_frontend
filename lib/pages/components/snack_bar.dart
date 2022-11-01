import 'package:flutter/material.dart';

void openSnackBar(context, snackMessage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor:  const Color(0xFFfbd737),
      action: SnackBarAction(
        label: "Ok",
        textColor: Colors.white,
        onPressed: () {},
      ),
      content: Text(
        snackMessage,
        style: const TextStyle(fontSize: 14),
      )));
}
