import './contact.dart';

class ContactRepository {

  //int LastId = 0;

  List<Contact> contacts = [
    Contact(name: 'Max', surname: 'Smith', phone: '3046789053'),
    Contact(name: 'Sidney', surname: 'Aguirre', phone: '3027869053'),
    Contact(name: 'Phineas', surname: 'Forbes', phone: '3034890567'),
  ];


  bool contactExist(Contact contact) {
    bool exists = false;
    contacts.forEach((element) {
      if (element == contact) {
        exists = true;
      }
    });
    return exists;
  }

  Contact getContact(Contact contact) {
    Contact getContact;
    contacts.forEach((element) {
      if (element == contact) {
        getContact = element;
      }
    });
    return getContact;
  }


  void editContact(Contact contact) {
    if (contactExist(contact)) {
      Contact currentContact = getContact(contact);
      currentContact.name = contact.name;
      currentContact.surname = contact.surname;
      currentContact.phone = contact.phone;

    } else {
    }
  }

  List<Contact> getContactList() {
    return contacts;
  }

  void deleteContact(Contact contact) {
    if (contactExist(contact)) {
      contacts.remove(contact);
    } else {
      return null;
    }
    print(contacts);
    return;
  }

  void addContact(Contact contact) {
    contacts.add(contact);
    contacts.forEach((e){
      print(e.name + " " + e.surname + " " + e.phone);
    });
    return;
  }
}
