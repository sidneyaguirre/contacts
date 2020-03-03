import 'package:contact_list/presenter/contact-list-presenter.dart';
import 'package:contact_list/views/contact-list.dart';
import 'package:flutter/material.dart';

import '../presenter/contact-list-presenter.dart';

class AddContact extends StatelessWidget {
  AddContact({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameControlller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
                ContactListPresenter().handleAddContact(
                    nameControl: nameController.text,
                    surnameControl: surnameControlller.text,
                    phoneControl: phoneController.text);
                if (nameController.text == "" &&
                    surnameControlller.text == "" &&
                    phoneController.text == "") {
                  return Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ContactList(ContactListPresenter())));
                } else
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Contact Saved!'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK',
                                style: TextStyle(
                                  fontSize: 24,
                                )),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ContactList(ContactListPresenter())));
                            },
                          ),
                        ],
                      );
                    },
                  ); //showDialog
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
                  labelText: "Last Name:",
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: phoneController,
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
