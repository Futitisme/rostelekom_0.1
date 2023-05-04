import 'package:flutter/material.dart';
import 'package:rostelekom_main_app/navigation_drawer_widget.dart';
import 'package:rostelekom_main_app/news_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final NewsManager _firestoreManager = NewsManager();
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 79, 18, 1),
          title: const Text('Новости'),
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
                    leading: Image.network('${document['Image']}'),
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
