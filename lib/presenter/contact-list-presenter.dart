import './contact.dart';
import '../model/repository.dart';

abstract class PresenterListener {
  void notify();
}

class ContactListPresenter {
  ContactListPresenter._(); //nombre
  static ContactListPresenter _clpresenter =
      new ContactListPresenter._(); //tipo de dato
  static ContactListPresenter get instance => _clpresenter; //cuerpo

  ContactRepository contactList = ContactRepository();

  List<PresenterListener> _listeners = [];

  bool emptyFields(
      String nameController, String surnameController, String phoneController) {
    if (nameController == "" &&
        surnameController == "" &&
        phoneController == "") {
      return true;
    } else {
      return false;
    }
  }

  int handleAddContact(
      {String nameControl, String surnameControl, String phoneControl}) {
    Contact newContact = createContact(
        name: nameControl, surname: surnameControl, phone: phoneControl);
    print(newContact);
    return addContact(newContact);
  }

  int handleDeleteContact(Contact contact) {
    return deleteContact(contact);
  }

  int handleEditContact(
      {int id,
      String nameControl,
      String surnameControl,
      String phoneControl}) {
    Contact contactEdited = Contact(
        id: id,
        name: nameControl,
        surname: surnameControl,
        phone: phoneControl);
    return editContact(contactEdited);
  }

  void notifyListeners() {
    _listeners.forEach((listener) {
      listener.notify();
    });
  }

  void addListener(PresenterListener listener) {
    _listeners.add(listener);
  }

  int addContact(Contact contact) {
    this.notifyListeners();
    return contactList.addContact(contact);
  }

  int editContact(Contact contact) {
    this.notifyListeners();
    return contactList.editContact(contact);
  }

  int deleteContact(Contact contact) {
    this.notifyListeners();
    return contactList.deleteContact(contact);
  }

  List<Contact> getContactList() {
    return contactList.getContactList();
  }

  Contact createContact({int id, String name, String surname, String phone}) {
    Contact newContact = Contact();
    newContact.name = name;
    newContact.surname = surname;
    newContact.phone = phone;
    return newContact;
  }
}
