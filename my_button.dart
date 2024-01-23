import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 35, 10, 25),
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 10), // Adjust the bottom padding as needed
        child: MaterialButton(
          onPressed: onPressed,
          color: Colors.yellow,
          child: Text(text),
        ),
      ),
    );
  }
}
