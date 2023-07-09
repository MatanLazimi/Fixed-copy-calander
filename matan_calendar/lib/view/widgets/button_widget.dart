import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  BtnWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        key: GlobalKey(),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
