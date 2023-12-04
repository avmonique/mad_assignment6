import 'package:ave_assignment6/models/contacts_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactsEntry extends StatelessWidget {
  ContactsEntry({Key? key, required this.onContactAdded , required this.contacts}) : super(key: key);

  final Function(ContactsItem) onContactAdded;
  final List<ContactsItem> contacts;

  var firstNameCont = TextEditingController();
  var lastNameCont = TextEditingController();
  var phoneNumCont = TextEditingController();
  var addressCont = TextEditingController();
  var emailCont = TextEditingController();

  void addContact(BuildContext context) {
    if (firstNameCont.text.isNotEmpty && lastNameCont.text.isNotEmpty && phoneNumCont.text.isNotEmpty && addressCont.text.isNotEmpty && emailCont.text.isNotEmpty) {
      if (!contacts.any((contact) => contact.phoneNumber == phoneNumCont.text)) { // PARA HINDI MA DUPLICATE YUNG PHONE NUMBER SYEMPRE KAILANGAN UNIQUE YUN HEHE
        ContactsItem newContact = ContactsItem(
          firstName: firstNameCont.text,
          lastName: lastNameCont.text,
          phoneNumber: phoneNumCont.text,
          address: addressCont.text,
          email: emailCont.text,
        );

        onContactAdded(newContact);

        Navigator.pop(context);
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("First Name"),
              TextField(
                controller: firstNameCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text("Last Name"),
              TextField(
                controller: lastNameCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text("Phone Number"),
              TextField(
                controller: phoneNumCont,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text("Address"),
              TextField(
                controller: addressCont,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Text("Email Address"),
              TextField(
                controller: emailCont,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  addContact(context);
                },
                child: Text("Add Contact"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
