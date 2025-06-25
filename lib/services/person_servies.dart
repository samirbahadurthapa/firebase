import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learning_firebase/model/person_model.dart';

class PersonServies {
  final _collection = FirebaseFirestore.instance.collection("person");

  Future<void> add_person(Person person) async {
    await _collection.doc(person.id).set(person.toJson());
  }

  Future<List<Person>> fetchPerson() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((data) => Person.fromJson(data.data())).toList();
  }
}
