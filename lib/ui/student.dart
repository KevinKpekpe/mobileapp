import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController promotionController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final GlobalKey<ScaffoldState> myKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      appBar: AppBar(
        title: const Text("STUDENT FORM IDENTITY"),
        actions: const [
          // Ajouter des actions sur nos boutons
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            TextFormField(
              controller: nomController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Nom de l'étudiant",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: prenomController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Prénom de l'étudiant",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: promotionController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Promotion de l'étudiant",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: adresseController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Adresse de l'étudiant",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: contactController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Contact de l'étudiant",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Email de l'étudiant",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                  print("Je viens de cliquer");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text("Enregistrer"),
            ),
          ],
        ),
      ),
    );
  }
}
