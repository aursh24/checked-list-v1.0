import 'package:ecomm/Util/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    Key? key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 198,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // User input
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    hintText: "Add a new task",
                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),

                // Buttons -> Save + Cancel
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Save button
                    MyButton(text: "Save", onPressed: onSave),

                    // Cancel button
                    MyButton(text: "Cancel", onPressed: onCancel),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
