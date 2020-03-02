import 'dart:developer';
import 'package:flutter/material.dart';

import './edit-contact.dart';
import '../presenter/contact-list-presenter.dart';

class ContactList extends StatefulWidget {
  final ContactListPresenter presenter;

  ContactList(this.presenter, {Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List contacts = ContactListPresenter().getContactList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Contact List')),
        body: Center(
            child: Column(
          children: <Widget>[
            ...contacts.map((element) {
              var initial = element['name'].substring(0, 1);
              return Card(
                elevation: 0,
                margin: EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(initial),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(element['name']),
                        Text(element['surname']),
                        Text(element['phone']),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            OutlineButton(
                              child: Icon(Icons.delete),
                              textColor: Colors.blue[200],
                              borderSide: BorderSide.none,
                              onPressed: () {
                                log('message');
                              },
                            ),
                            FlatButton(
                              hoverColor: Colors.blueAccent,
                              onPressed: () {
                                log('message');
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return EditContact();
                                }));
                              },
                              child: Icon(Icons.edit),
                              color: Colors.blue[200],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            })
          ],
        )));
  }
}
