import 'package:contact_list/model/model.dart';

class ContactListPresenter {
  /* TextEditingController nameControl = TextEditingController();
  TextEditingController surnameControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();
 */


  var contactList = ContactRepository();

  void handleAddContact({String nameControl, String surnameControl,String phoneControl}) {
    Map newContact =  createContact(name: nameControl, surname: surnameControl, phone: phoneControl);
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

  bool contactExist(Map contact){
    return contactList.contactExist(contact);
  }

  Map createContact({String name, String surname,String phone}){
    Map newContact =  Map();
        newContact['name'] = name;
        newContact['surname']= surname;
        newContact['phone'] = phone;
        return newContact;
  }
}
