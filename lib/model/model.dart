
class ContactRepository {
  List<Map> contacts = [
    {
      'name': 'Max',
      'surname': 'Smith',
      'phone': '3046789053'
    },
    {
      'name': 'Sidney',
      'surname': 'Aguirre',
      'phone': '3027869053'
    },
    {
      'name': 'Phineas',
      'surname': 'Forbes',
      'phone': '3034890567'
    }
  ];


  void editContact(Map contact) {}

  bool contactExist(Map contact) {
    bool exists = false;
    contacts.forEach((element) {
      if (element == contact) {
        exists = true;
      }
    });
    return exists;
  }

  Map getContact(Map contact) {
    Map getContact;
    contacts.forEach((element) {
      if (element == contact) {
        getContact = element;
      }
    });
    return getContact;
  }

  List<Map> getContactList() {
    return contacts;
  }

  void deleteContact(Map contact) {
    if (contactExist(contact)) {
      contacts.remove(contact);
    } else {
      return null;
    }
    print(contacts);
    return;
  }

  void addContact(Map contact) {
    contacts.add(contact);
    contacts.forEach((e){
      print(e['name'] + " " + e['surname'] + " " + e['phone']);
    });
    print(contacts.contains(contact));
    return;
  }
}
