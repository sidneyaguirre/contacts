import 'dart:developer';
import 'package:contact_list/presenter/contact-list-presenter.dart';
import 'package:flutter/material.dart';

import '../presenter/contact-list-presenter.dart';


class AddContact extends StatelessWidget {
  AddContact({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
        leading: Builder(builder: (BuildContext ctx) {
          return IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context));
        }),
      ),
      body: Form(
        key: _formKey,
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                log('message');
                ContactListPresenter().handleAddContact();
              },
              child: Text('Save'),
              color: Colors.blue[200],
            ),
            Expanded(
              child: TextFormField(
                controller: ContactListPresenter().nameControl,
                decoration: InputDecoration(
                  labelText: "First Name:",
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: ContactListPresenter().surnameControl,
                decoration: InputDecoration(
                  labelText: "Last Name:",
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: ContactListPresenter().phoneControl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number:",
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
