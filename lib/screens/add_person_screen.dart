import 'package:flutter/material.dart';

class AddPersonScreen extends StatelessWidget {
  const AddPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text("Firebase"),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}