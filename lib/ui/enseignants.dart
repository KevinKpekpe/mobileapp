// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/model/enseignant.dart';
import 'package:myapp/ui/chargement.dart';
import 'package:myapp/ui/enseignant.dart';
import 'package:myapp/ui/enseignant_details.dart';
import 'package:myapp/ui/eror.dart';
import 'package:myapp/utilis/utilis.dart';


class EnseignantsPage extends StatelessWidget {
  const EnseignantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
    stream: firestore.collection("enseignant").snapshots(), 
    builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
        if(snapshot.hasError){
          return NotFoundPage();
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          return ChargementPage();
        }
      return Scaffold(
        appBar: AppBar(
          title: Text("Nos Enseignants"),
          actions: [
            IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherPage()));
            }, icon: Icon(Icons.add)),
          ],
        ),
        body: ListView(
          children: snapshot.data!.docs.map((document){
            return ListTile(
              onTap:(){
              Enseignant enseignant = Enseignant(
                matricule :document["matricule"],
                nom:  document["nom"],
                prenom:  document["prenom"],
                contact:  document["contact"],
                email:  document["email"],
                specialite:  document["specialite"]
              );
                Navigator.push(context, MaterialPageRoute(builder: (context) => EnseignantDetailsPage(enseignant: enseignant,)));
              } ,
              title: Text(document["nom" ] + document['prenom']),
              subtitle: Text(document["contact"]),
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box_rounded),
        onPressed: (){
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TeacherPage()));
        }),
      );
    }
    );
  }
}