import 'package:flutter/material.dart';

import '../contact-list.dart';

class ErrorAlert extends StatelessWidget {
  const ErrorAlert({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error!'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Couldn\'t save contact...'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('OK',
              style: TextStyle(
                fontSize: 24,
              )),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ContactList()));
          },
        ),
      ],
    );
  }
}
