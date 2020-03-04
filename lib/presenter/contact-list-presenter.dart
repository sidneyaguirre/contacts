import '../model/contact.dart';
import '../model/repository.dart';

class ContactListPresenter {

  ContactRepository contactList = ContactRepository();

  void handleAddContact({String nameControl, String surnameControl,String phoneControl}) {
    Contact newContact =  createContact(name: nameControl, surname: surnameControl, phone: phoneControl);
    print(newContact);
    addContact(newContact);
  }

  void editContact(Contact contact) {
    return contactList.editContact(contact);
  }

  void deleteContact(Contact contact) {
    return contactList.deleteContact(contact);
  }

  void addContact(Contact contact) {
    return contactList.addContact(contact);
  }

  List<Contact> getContactList() {
    return contactList.getContactList();
  }

  bool contactExist(Contact contact){
    return contactList.contactExist(contact);
  }

  Contact createContact({String name, String surname,String phone}){
    Contact newContact =  Contact();
        newContact.name = name;
        newContact.surname= surname;
        newContact.phone = phone;
        return newContact;
  }
}
