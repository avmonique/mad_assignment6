import 'package:ave_assignment6/models/contacts_item.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final ContactsItem contact;

  ContactView({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("First Name"),
            TextField(
              controller: TextEditingController(text: contact.firstName),
              readOnly: true,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Text("Last Name"),
            TextField(
              controller: TextEditingController(text: contact.lastName),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Text("Phone Number"),
            TextField(
              controller: TextEditingController(text: contact.phoneNumber),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Text("Address"),
            TextField(
              controller: TextEditingController(text: contact.address),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Text("Email Address"),
            TextField(
              controller: TextEditingController(text: contact.email),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
