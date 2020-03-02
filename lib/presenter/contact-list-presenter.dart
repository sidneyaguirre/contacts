import 'package:contact_list/model/model.dart';
import 'package:flutter/material.dart';

class ContactListPresenter {
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController surnameControl = TextEditingController();
  final TextEditingController phoneControl = TextEditingController();

  var contactList = ContactRepository();

  void handleAddContact() {
    Map newContact =  Map();
        newContact['name'] = nameControl.toString();
        newContact['surname']= surnameControl.toString();
        newContact['phone'] = phoneControl.toString();
    print(newContact);
    addContact(newContact);
  }

  void editContact(Map contact) {
    return contactList.editContact(contact);
  }

  void deleteContact(Map contact) {
    return contactList.deleteContact(contact);
  }

  void addContact(Map contact) {
    return contactList.addContact(contact);
  }

  List<Map> getContactList() {
    return contactList.getContactList();
  }
}
