// ignore_for_file: prefer_const_constructors, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myapp/model/enseignant.dart';
import 'package:url_launcher/url_launcher.dart';

class EnseignantDetailsPage extends StatelessWidget {
  final Enseignant enseignant;
  const EnseignantDetailsPage({Key? key, required this.enseignant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INFORMATION ENSEIGNANT"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "images/avatar.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Divider(
              height: 50,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              "Matricule : ${enseignant.matricule}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Nom : ${enseignant.nom}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Prénom : ${enseignant.prenom}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launch("tel:${enseignant.contact.toString()}"),
              child: Text(
                "Contact : ${enseignant.contact}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launch("mailto:${enseignant.email.toString().toString()}"),
              child: Text(
                "Email : ${enseignant.email}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Spécialité : ${enseignant.specialite}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

void _launch(String num) async {
    if (!await launch(num)) throw '';
  }
}
