import 'package:flutter/material.dart';

import '../presenter/contact-list-presenter.dart';
import 'contact-list.dart';

class EditContact extends StatelessWidget {
  final String name;
  final String surname;
  final String phone;

  EditContact({Key key, this.name, this.surname, this.phone}) : super(key: key);

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
                controller: TextEditingController(text: this.name),
                decoration: InputDecoration(
                  labelText: "First Name:",
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: TextEditingController(text: this.surname),
                decoration: InputDecoration(
                  labelText: "Surname:",
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: TextEditingController(text: this.phone),
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
