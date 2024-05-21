import 'package:myapp/utilis/utilis.dart';

class EnseignantController{
  Future <String> enregistrerEnseignant(String matricule,String nom,String prenom,String specialite,String contact,String email) async{
    String response ="";
      try{
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
}