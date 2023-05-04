import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../events_manager.dart';

class EventsPage extends StatelessWidget {
  EventsPage({super.key});
  final EventsManager _firestoreManager = EventsManager();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Мероприятия'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 79, 18, 1),
        ),
        body: StreamBuilder(
          stream: _firestoreManager.dataCollection.snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot document = snapshot.data.docs[index];
                  return ListTile(
                    title: Text(document['Name']),
                    subtitle: Text(document['Description']),
                  );
                },
              );
            }
          },
        ),
      );
}
