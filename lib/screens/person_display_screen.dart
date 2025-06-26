import 'package:flutter/material.dart';
import 'package:learning_firebase/provider/person_provider.dart';
import 'package:provider/provider.dart'; 
class  UserprofileScreen extends StatelessWidget {
  const  UserprofileScreen({super.key});

  @override
  Widget build(BuildContext context) { 
    final provider=Provider.of<PersonProvider>(context);
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
        itemBuilder: (context,index){ 
         
               return ListTile(   
                
                leading: CircleAvatar( 
                  child: Text(provider.person[index].name[0]),  
                  radius: 23),
                   title: Text(provider.person[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),  
                   subtitle: Row( 
                    children: [ 
                     Text("Age:${provider.person[index].age}"),
                      SizedBox(width: 10,), 
                      Expanded(child: Text( 
                        maxLines: 1, 
                        overflow: TextOverflow.ellipsis,
                        "Profession:${provider.person[index].profession}"))
                    ],
                   ),
                  trailing: PopupMenuButton(itemBuilder: (context)=>[ 
                    PopupMenuItem(child: Text("Edit"),value: "edit",), 
                    PopupMenuItem(child: Text("Delete"),value: "delete",)
                  ]),
               );
      }),
    );
  }
}