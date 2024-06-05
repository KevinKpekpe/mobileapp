// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:myapp/utilis/utilis.dart';

class EnseignantController{
  Future <String> enregistrerEnseignant(String matricule,String nom,String prenom,String specialite,String contact,String email,File file) async{
    String response ="";
      try{
        await uploadFile(nom, file);
        await firestore.collection("enseignant").doc(matricule).set({
          "matricule":matricule,
          "nom":nom,
          "prenom":prenom,
          "specialite":specialite,
          "contact":contact,
          "email":email
        });
        response = "Reussie";
      }catch(e){
        response =e.toString();
      }
      return response;
  }
  uploadFile(String nom,File file) async{
    Reference ref = firebaseStorage.ref().child("photoenseignant").child(nom);
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot snapshot = await uploadTask;
  }
}