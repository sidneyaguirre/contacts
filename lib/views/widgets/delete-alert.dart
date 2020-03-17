
import 'package:flutter/material.dart';

import '../../presenter/contact-list-presenter.dart';
import '../../presenter/contact.dart';
import '../contact-list.dart';

class DeleteAlert extends StatelessWidget {
  final Contact contact;
  
  const DeleteAlert(this.contact, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete this contact?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('This contact will be removed.'),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text(
            'Delete',
          ),
          onPressed: () {
            ContactListPresenter.instance.handleDeleteContact(contact);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => ContactList()));
          },
        ),
      ],
    );
  }
}
