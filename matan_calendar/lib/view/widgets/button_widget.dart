import 'package:flutter/material.dart';

class BtnWidget extends StatelessWidget {
  final Function()? onPressed;
  BtnWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        key: GlobalKey(),
        onPressed: onPressed,
        child: const Text('Send'),
      ),
    );
  }
}
