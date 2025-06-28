import 'package:flutter/material.dart';
import 'package:learning_firebase/provider/person_provider.dart';
import 'package:provider/provider.dart';

import '../model/person_model.dart';

class UserprofileScreen extends StatelessWidget {
  const UserprofileScreen({super.key});
  void _editDialog(
    BuildContext context,
    Person person,
    PersonProvider PersonProvider,
  ) {
    final nameController = TextEditingController(text: person.name);
    final ageController = TextEditingController(text: person.age.toString());
    final professionController = TextEditingController(text: person.profession);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Edit Person"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "name"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(hintText: "Age"),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: professionController,
                  decoration: InputDecoration(hintText: "profession"),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final updataData = Person(
                          id: person.id,
                          name: nameController.text,
                          age: int.tryParse(ageController.text) ?? person.age,
                          profession: professionController.text,
                        );
                        await PersonProvider.updatePerson(updataData);
                        Navigator.pop(context); 
                        ScaffoldMessenger.of(context).showSnackBar( 
                          SnackBar(content: Text("Updated Succesfully"), 
                          backgroundColor: Colors.green,)
                        );
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PersonProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Person display Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: provider.person.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(provider.person[index].name[0]),
              radius: 23,
            ),
            title: Text(
              provider.person[index].name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Text("Age:${provider.person[index].age}"),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    "Profession:${provider.person[index].profession}",
                  ),
                ),
              ],
            ),
            trailing: PopupMenuButton(
              onSelected: (value) async{
                if (value == "edit") {
                  _editDialog(context, provider.person[index], provider);
                } else if (value == 'delete'){ 
                  await provider.deletePerson(provider.person[index].id);
                }
              },
              itemBuilder:
                  (context) => [
                    PopupMenuItem(child: Text("Edit"), value: "edit"),
                    PopupMenuItem(child: Text("Delete"), value: "delete"),
                  ],
            ),
          );
        },
      ),
    );
  }
}
