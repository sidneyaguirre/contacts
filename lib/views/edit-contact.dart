import '../presenter/contact.dart';
import 'package:flutter/material.dart';

import '../presenter/contact-list-presenter.dart';
import 'contact-list.dart';

class EditContact extends StatefulWidget {
  final Contact contactToEdit;
  final ContactListPresenter contactListPresenter;
  EditContact(this.contactListPresenter, {Key key, this.contactToEdit})
      : super(key: key);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  int contactId;
  TextEditingController nameController;
  TextEditingController surnameController;
  TextEditingController phoneController;

  void initState() {
    super.initState();
    contactId = this.widget.contactToEdit.id;
    nameController =
        TextEditingController(text: this.widget.contactToEdit.name);
    surnameController =
        TextEditingController(text: this.widget.contactToEdit.surname);
    phoneController =
        TextEditingController(text: this.widget.contactToEdit.phone);
  }

  final _formKey = GlobalKey<FormState>();
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
                this.widget.contactListPresenter.handleEditContact(
                    nameControl: nameController.text,
                    surnameControl: surnameController.text,
                    phoneControl: phoneController.text);
                if (this.widget.contactListPresenter.emptyFields(
                    nameController.text,
                    surnameController.text,
                    phoneController.text)) {
                  return Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ContactList()));
                } else if (this.widget.contactListPresenter.handleEditContact(
                        id: contactId,
                        nameControl: nameController.text,
                        surnameControl: surnameController.text,
                        phoneControl: phoneController.text) !=
                    null) {
                  var l = this.widget.contactListPresenter.getContactList();
                  l.forEach((e) {
                    print(e.id.toString() + " " + e.name + " " + e.phone);
                  });
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Contact Edited!'),
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
                                  builder: (BuildContext context) =>
                                      ContactList()));
                            },
                          ),
                        ],
                      );
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
                  labelText: "Surname:",
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
