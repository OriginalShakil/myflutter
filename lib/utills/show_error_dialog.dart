import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String msg) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Something Went Wrong'),
        content: Text(msg),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'))
        ],
      );
    },
  );
}
