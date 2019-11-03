import 'package:flutter/material.dart';

showAlert(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        content: Text(message),
        actions: <Widget>[
          // can be extended to the widgets you want
          FlatButton(
            child: Text(
              'OK',
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
