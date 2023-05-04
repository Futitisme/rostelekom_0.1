import 'package:cloud_firestore/cloud_firestore.dart';

class EventsManager {
  final CollectionReference dataCollection =
      FirebaseFirestore.instance.collection('Events');

  Future<List<DocumentSnapshot>> getData() async {
    QuerySnapshot querySnapshot = await dataCollection.get();
    return querySnapshot.docs;
  }

  Future<void> addData(String name, String description) async {
    await dataCollection.add({
      'Name': name,
      'Description': description,
    });
  }

  Future<void> deleteData(String id) async {
    await dataCollection.doc(id).delete();
  }
}
