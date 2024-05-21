import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EtudiantPage extends StatefulWidget {
  const EtudiantPage({super.key});

  @override
  State<EtudiantPage> createState() => _EtudiantPageState();
}

class _EtudiantPageState extends State<EtudiantPage> {
  late TextEditingController nomController;
  late TextEditingController prenomController;
  late TextEditingController promotionController;
  late TextEditingController adresseController;
  late TextEditingController dateController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvel Etudiant : "),
      ),
      body:SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.text,
              controller: nomController,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "Nom",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.text,
              controller: prenomController,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "Prenom",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.text,
              controller: promotionController,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "Promotion",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                ),
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.text,
              controller: adresseController,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: "Adresse",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Genre : "),
                Switch(
                    value: switchValue,
                    onChanged: (bool){
                      setState(() {
                        switchValue = bool;
                      });
                    }
                ),
              ],
            ),
            const SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: dateController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_month),
                hintText: "Date",
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                ),
              ),
              onTap: (){
                showCalendrier();
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              checkEmptyField();
            }, child: const Text('Enregistrer'))
          ],
        ),
      ),
    );
    
  }
  showMessageDialog(String message){
    final monSnackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(monSnackbar);
  }
  showCalendrier(){
    showDatePicker(
        context: context,
        firstDate: DateTime(1950), 
        lastDate: DateTime(2050), 
        initialDate: DateTime.now(),
    ).then((value){
      if(value != null){
        setState(() {
          String dateJour = DateFormat.yMMMd().format(value);
          dateController.text = dateJour;
        });
      }
    });
  }
  checkEmptyField(){
    if(nomController.text.isEmpty){
        showMessageDialog("Le champ nom est vide");
    }else if(prenomController.text.isEmpty){
        showMessageDialog("Le champ prenom est vide");
    }else if(promotionController.text.isEmpty){
        showMessageDialog("Le champ promotion est vide");
    }else if(adresseController.text.isEmpty){
        showMessageDialog("Le champ adresse est vide");
    }else{
      print("Information Enregistrée");
    }
  }
}
