import 'package:contact_list/presenter/contact-list-presenter.dart';
import 'package:flutter/material.dart';
import './views/contact-list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactList(ContactListPresenter()),
    );
  }
}
