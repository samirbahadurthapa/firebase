import 'dart:async'; 

import 'package:flutter/material.dart';
import 'package:learning_firebase/provider/person_provider.dart';
import 'package:learning_firebase/screens/person_display_screen.dart';
import 'package:provider/provider.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({super.key});

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _professionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);
    return Scaffold(
      appBar: AppBar(toolbarHeight: 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/hello.png")),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forum Fillup",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Enter your Details to Continue",
                    style: TextStyle(color: Colors.grey[700], fontSize: 17),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 12, left: 20),
                            filled: true,
                            fillColor: Colors.white24,
                            border: InputBorder.none,

                            hintText: "Enter your full Name",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _ageController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 12, left: 20),
                            filled: true,
                            fillColor: Colors.white24,
                            border: InputBorder.none,
                            hintText: "Enter your age",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _professionController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 0,
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 12, left: 20),
                            filled: true,
                            fillColor: Colors.white24,
                            border: InputBorder.none,

                            hintText: "Enter your Profession",
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[500],
                    ),
                    child: InkWell(
                      onTap: () async {
                        final name = _nameController.text;
                        final age = int.tryParse(_ageController.text) ?? 0;
                        final profession = _professionController.text;
                        if (name.isEmpty || age == 0 || profession.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please fill all content"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          final sucess = await provider.addPerson(
                            name,
                            age,
                            profession,
                          );
                          if (sucess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Person data added succesfully"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Failed to add succesfully"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                        _ageController.clear();
                        _nameController.clear();
                        _professionController.clear();
                      },
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => UserprofileScreen()),
                      );
                    },
                    child: Text("hello"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
