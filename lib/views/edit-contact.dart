import 'dart:developer';

import 'package:flutter/material.dart';

//import '../presenter/presenter.dart';

class EditContact extends StatefulWidget {
  EditContact({Key key, String name, String surname, String phone})
      : super(key: key);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameControlller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Contact'),
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
              },
              child: Text('Save'),
              color: Colors.blue[200],
            ),
            Expanded(
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "First Name:",
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: surnameControlller,
                decoration: InputDecoration(
                  labelText: "Surname:",
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: phoneController,
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
