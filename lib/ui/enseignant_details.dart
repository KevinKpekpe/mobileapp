// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:myapp/model/enseignant.dart';

class EnseignantDetailsPage extends StatelessWidget {
  final Enseignant enseignant;
  const EnseignantDetailsPage({super.key, required this.enseignant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INFORMATION ENSEINGNANT"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.45,
              child: Image(image: AssetImage("images/avatar.jpg")),
            ),
            Divider(
              color: Colors.blue,
            ),
            SizedBox(height: 10,),
            Text("Matricule : "+enseignant.matricule.toString()),
            Text("Nom : " +enseignant.nom.toString()),
            Text("Prenom:" +enseignant.prenom.toString()),
            Text("Contact:" +enseignant.contact.toString()),
            Text("Email:" +enseignant.email.toString()),
            Text("Specialite:" +enseignant.specialite.toString()),
          ],
        ),
      ),
    );
  }
}
