import 'package:contact_list/model/model.dart';

class ContactListPresenter {
  /* TextEditingController nameControl = TextEditingController();
  TextEditingController surnameControl = TextEditingController();
  TextEditingController phoneControl = TextEditingController();
 */


  var contactList = ContactRepository();

  void handleAddContact({String nameControl, String surnameControl,String phoneControl}) {
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
