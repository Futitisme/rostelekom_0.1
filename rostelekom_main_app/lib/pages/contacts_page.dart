import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;
  Contact({required this.name, required this.phone, required this.email});
}

class ContactsPage extends StatelessWidget {
  ContactsPage({super.key});

  final List<Contact> contacts = [
    Contact(
        name: 'John Doe', phone: '123-456-7890', email: 'john.doe@example.com'),
    Contact(
        name: 'Jane Doe', phone: '987-654-3210', email: 'jane.doe@example.com'),
    Contact(
        name: 'Bob Smith',
        phone: '555-555-5555',
        email: 'bob.smith@example.com'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Контакты'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 79, 18, 1),
        ),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            final contact = contacts[index];
            return Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(contact.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contact.phone),
                    Text(contact.email),
                  ],
                ),
              ),
            );
          },
        ),
      );
}
