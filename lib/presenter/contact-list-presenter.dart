import './contact.dart';
import '../model/repository.dart';

class ContactListPresenter {
  ContactRepository contactList = ContactRepository();

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

  int handleDeleteContact(Contact contact){
    return deleteContact(contact);
  }

  int handleEditContact(
      {String nameControl, String surnameControl, String phoneControl}) {
    Contact newContact = createContact(
        name: nameControl, surname: surnameControl, phone: phoneControl);
    print(newContact);
    return editContact(newContact);
  }

  int addContact(Contact contact) {
    return contactList.addContact(contact);
  }

  int editContact(Contact contact) {
    return contactList.editContact(contact);
  }

  int deleteContact(Contact contact) {
    return contactList.deleteContact(contact);
  }

  List<Contact> getContactList() {
    return contactList.getContactList();
  }

  Contact createContact({String name, String surname, String phone}) {
    Contact newContact = Contact();
    newContact.name = name;
    newContact.surname = surname;
    newContact.phone = phone;
    return newContact;
  }
}
