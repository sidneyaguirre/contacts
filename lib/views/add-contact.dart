import 'package:flutter/material.dart';

import '../presenter/contact-list-presenter.dart';
import './contact-list.dart';
import '../views/widgets/error-alert.dart';


class AddContact extends StatelessWidget {
  final ContactListPresenter contactListPresenter;
  AddContact(this.contactListPresenter, {Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
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
                if (contactListPresenter.emptyFields(nameController.text,
                    surnameController.text, phoneController.text)) {
                  return Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ContactList()));
                } else if (this.contactListPresenter.handleAddContact(
                        nameControl: nameController.text,
                        surnameControl: surnameController.text,
                        phoneControl: phoneController.text) !=
                    null) {
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
                                      ContactList()));
                            },
                          ),
                        ],
                      );
                    },
                  ); //showDialog
                } else {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return ErrorAlert();
                    },
                  ); //showDialog
                }
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
                controller: surnameController,
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
