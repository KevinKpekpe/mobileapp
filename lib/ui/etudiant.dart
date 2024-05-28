// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EtudiantPage extends StatefulWidget {
  const EtudiantPage({Key? key}) : super(key: key);

  @override
  State<EtudiantPage> createState() => _EtudiantPageState();
}

class _EtudiantPageState extends State<EtudiantPage> {
  late TextEditingController nomController;
  late TextEditingController prenomController;
  late TextEditingController promotionController;
  late TextEditingController adresseController;
  late TextEditingController dateController;
  File? _image;

  bool switchValue = false;
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    nomController = TextEditingController();
    prenomController = TextEditingController();
    promotionController = TextEditingController();
    adresseController = TextEditingController();
    dateController = TextEditingController();
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showPickerDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choisir depuis la Galerie'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Prendre une Photo'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvel Etudiant"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Informations personnelles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: prenomController,
              decoration: const InputDecoration(
                labelText: 'Prénom',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: promotionController,
              decoration: const InputDecoration(
                labelText: 'Promotion',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: adresseController,
              decoration: const InputDecoration(
                labelText: 'Adresse',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Genre : "),
                Switch(
                  value: switchValue,
                  onChanged: (bool val) {
                    setState(() {
                      switchValue = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: dateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Date de naissance',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                showCalendrier();
              },
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _showPickerDialog(context),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? Icon(Icons.camera_alt,
                        size: 40, color: Colors.grey.shade800)
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                checkEmptyField();
              },
              child: const Text('Enregistrer'),
            )
          ],
        ),
      ),
    );
  }

  void showMessageDialog(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showCalendrier() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value != null) {
        setState(() {
          String formattedDate = DateFormat.yMMMd().format(value);
          dateController.text = formattedDate;
        });
      }
    });
  }

  void checkEmptyField() {
    if (nomController.text.isEmpty) {
      showMessageDialog("Le champ nom est vide");
    } else if (prenomController.text.isEmpty) {
      showMessageDialog("Le champ prénom est vide");
    } else if (promotionController.text.isEmpty) {
      showMessageDialog("Le champ promotion est vide");
    } else if (adresseController.text.isEmpty) {
      showMessageDialog("Le champ adresse est vide");
    } else {
      print("Informations enregistrées");
    }
  }
}

