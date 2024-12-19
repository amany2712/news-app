import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(
    this.message ,{
    super.key
    });
  final String message; 

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(message),
    );
  }
}
