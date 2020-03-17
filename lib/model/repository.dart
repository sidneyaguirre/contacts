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

  Contact getContact(int contactId) {
    Contact getContact;
    contacts.forEach((element) {
      if (element.id == contactId) {
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
      print("New Info: " + e.id.toString() + " " + e.name + " " + e.surname + " " + e.phone);
    });
    return contact.id;
  }

  int editContact(Contact contact) {
    int editedContactId = contact.id;
    Contact currentContact = getContact(editedContactId);
    if (currentContact != null) {
      currentContact.name = contact.name;
      currentContact.surname = contact.surname;
      currentContact.phone = contact.phone;
      /* contacts.forEach((e) {
        print(e.id.toString() + " " + e.name + " " + e.surname + " " + e.phone);
      }); */
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
