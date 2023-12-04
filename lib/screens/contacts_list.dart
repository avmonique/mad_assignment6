import 'package:ave_assignment6/models/contacts_entry.dart';
import 'package:ave_assignment6/models/contacts_item.dart';
import 'package:ave_assignment6/screens/contact_view.dart';
import 'package:flutter/material.dart';

class ContactsListScreen extends StatefulWidget {
  ContactsListScreen({super.key});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {

  List<ContactsItem> contacts = [
    ContactsItem(firstName: "Monica", lastName: "Ave", phoneNumber: "09123456789", address: "Urdaneta City", email: "ave@gmail.com")
  ];

  void addContactToList(ContactsItem newContact) {
    setState(() {
      contacts.add(newContact);
    });
  }

  void showDeleteConDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Contact"),
          content: Text("Are you sure you want to delete this contact?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                deleteContact(index);
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void showContactDetails(int index) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ContactView(contact: contacts[index]),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts Organizer"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ContactsEntry(onContactAdded: addContactToList, contacts: contacts),
                ),
              );
            }, 
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    showContactDetails(index);
                  },
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(contacts[index].firstName[0] + contacts[index].lastName[0]),
                        ),
                        title: Text("${contacts[index].firstName} ${contacts[index].lastName}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(contacts[index].phoneNumber),
                        trailing: IconButton(
                          onPressed: () {
                            showDeleteConDialog(index);
                          }, 
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}