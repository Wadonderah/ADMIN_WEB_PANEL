import 'package:flutter/material.dart';

class CommonViewModel {
  showSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.purple,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
