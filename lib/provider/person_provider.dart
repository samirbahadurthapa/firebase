import 'package:flutter/material.dart';
import 'package:learning_firebase/model/person_model.dart';
import 'package:learning_firebase/services/person_servies.dart';
import 'package:uuid/uuid.dart';

class PersonProvider extends ChangeNotifier {
  PersonServies _servies = PersonServies();
  List<Person> _person = [];
  List<Person> get person => _person;

  Future<void> fetchPerson() async {
    _person = await _servies.fetchPerson();
    notifyListeners();
  }

  Future<void> addPerson(String name, int age, String profession) async {
    final person = Person(
      id: Uuid().v4(),
      name: name,
      age: age,
      profession: profession,
    );
    await _servies.add_person(person);
    notifyListeners();
  }
}
