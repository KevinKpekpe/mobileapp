// ignore_for_file: avoid_print, unused_field, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/controller/enseingnant_controller.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late TextEditingController matriculeController;
  late TextEditingController nameController;
  late TextEditingController lastnameController;
  late TextEditingController specialityController;
  late TextEditingController phoneController;
  late TextEditingController mailController ;

  File? _image;
  final _imagePicker = ImagePicker();



  final GlobalKey<ScaffoldState> myKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    matriculeController = TextEditingController();
    nameController = TextEditingController();
    lastnameController = TextEditingController();
    specialityController = TextEditingController();
    phoneController = TextEditingController();
    mailController = TextEditingController();
    _image = File("");
  }
  reset(){
    matriculeController.clear();
    nameController.clear();
    specialityController.clear();
    mailController.clear();
    phoneController.clear();
    lastnameController.clear();
  }
  Future <void> getImage() async{
    final XFile? _imageXfile = await _imagePicker.pickImage(source: ImageSource.gallery);

    if(_imageXfile != null){
      setState(() {
        _image = File(_imageXfile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey,
      appBar: AppBar(
        title: const Text("TEACHER FORM IDENTITY"),
        actions: const [
          // Ajouter des actions sur nos boutons
        ],
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Container(
                  width: MediaQuery.of(context).size.height *50,
                  height: MediaQuery.of(context).size.height * 0.150,
                  child: InkWell(
                    onTap: (){
                      getImage();
                    },
                    child: CircleAvatar(
                      radius: 50,
                      child: _image != null ? Image.file(_image!) : Image.asset(
                      "images/avatar.png",
                      height: 100,
                      width: 100,
                    ),
                    ),
                  ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: matriculeController,
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Matricule de l'Etudiant ",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Nom de l'Enseignant ",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.text,
                controller: lastnameController,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Nom de famille de l'enseignant",
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: specialityController,
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Specialite de l'enseignant",
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Contact de l'enseignant",
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: mailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: "Email de l'enseignant",
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    save();

              }, child: const Text("SAUVEGARDER"))
            ],
          ),
        ),
      ),
    );
  }
  showMessageDialog(String message){
    final monSnackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(monSnackbar);
  }
  save(){
    if(matriculeController.text.isEmpty){
      showMessageDialog("Le matriculate  est vide");
    }else if(lastnameController.text.isEmpty){
      showMessageDialog("Le champ prenom est vide");
    }else if(nameController.text.isEmpty){
      showMessageDialog("Le champ nom est vide");
    }else if(specialityController.text.isEmpty){
      showMessageDialog("Le champ speciality est vide");
    }else if(phoneController.text.isEmpty){
      showMessageDialog("Le champ phone est vide");
    }else if(mailController.text.isEmpty){
      showMessageDialog("Le champ email est vide");
    }
    else{
      // Firebase
      String matricule = matriculeController.text.toUpperCase();
      String nom = nameController.text.toUpperCase();
      String prenom = lastnameController.text.toUpperCase();
      String specialite = specialityController.text.toUpperCase();
      String phone = phoneController.text;
      String email = mailController.text.toLowerCase();
      EnseignantController ense = EnseignantController();
      var reponse = ense.enregistrerEnseignant(matricule, nom, prenom, specialite, phone, email,_image!);

      if(reponse=="Reussie"){
        showMessageDialog("Operation reussie");
        reset();
      }else{
        showMessageDialog("$reponse");
      }
    }
  }
}