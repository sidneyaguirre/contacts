import '../presenter/contact.dart';

class ContactRepository {
  int lastId = 2;

  List<Contact> contacts = [
    Contact(id: 0, name: 'Max', surname: 'Smith', phone: '3046789053'),
    Contact(id: 1, name: 'Sidney', surname: 'Aguirre', phone: '3027869053'),
    Contact(id: 2, name: 'Phineas', surname: 'Forbes', phone: '3034890567'),
  ];

  bool contactExist(int contactId) {
    bool exists = false;
    contacts.forEach((element) {
      if (element.id == contactId) {
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

  int addContact(Contact contact) {
    this.lastId += 1;
    contact.id = this.lastId;
    contacts.add(contact);
    contacts.forEach((e) {
      print(e.id.toString() + " " + e.name + " " + e.surname + " " + e.phone);
    });
    return contact.id;
  }

  int editContact(Contact contact) {
    Contact currentContact = getContact(contact);
    int index = contacts.indexOf(contact);
    if (currentContact != null) {
      currentContact.name = contact.name;
      currentContact.surname = contact.surname;
      currentContact.phone = contact.phone;
      contacts[index] = currentContact;
      contacts.forEach((e) {
        print(e.id.toString() + " " + e.name + " " + e.surname + " " + e.phone);
      });
      return currentContact.id;
    } else
      return -1;
  }

  List<Contact> getContactList() {
    return contacts;
  }

  int deleteContact(Contact contact) {
    int contactId = contact.id;
    if (contactExist(contactId)) {
      contacts.remove(contact);
      print(contacts);
    return contact.id;
    } else {
      return null;
    }
  }
}
