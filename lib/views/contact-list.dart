import 'dart:developer';
import 'package:flutter/material.dart';

import '../presenter/contact.dart';
import './add-contact.dart';
import './edit-contact.dart';
import '../presenter/contact-list-presenter.dart';
import './widgets/delete-alert.dart';

class ContactList extends StatefulWidget {
  ContactList({Key key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList>
    implements PresenterListener {
  void initState() {
    ContactListPresenter.instance.addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = ContactListPresenter.instance.getContactList();
    return Scaffold(
        appBar: AppBar(title: Text('My Contacts')),
        body: Center(
            child: contacts.length > 0
                ? Column(
                    children: <Widget>[
                      ...contacts.map((element) {
                        var initial = element.name.substring(0, 1);
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(element.name),
                                  Text(element.surname),
                                  Text(element.phone),
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
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible:
                                                false, // user must tap button!
                                            builder: (BuildContext context) {
                                              return DeleteAlert(element);
                                            },
                                          );
                                        },
                                      ),
                                      FlatButton(
                                        hoverColor: Colors.blueAccent,
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (_) {
                                            return EditContact(
                                                ContactListPresenter.instance,
                                                contactToEdit: element);
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
                  )
                : Center(
                    child: Text(
                      'No contacts in the List',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            log('message');
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return AddContact(ContactListPresenter.instance);
            }));
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }

  @override
  void notify() {
    setState(() {});
  }
}
