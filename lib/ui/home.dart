
// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:myapp/ui/enseignant.dart';
import 'package:myapp/ui/enseignants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'etudiant.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fasi App"),
        //backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: [
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blue,
                ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("images/logo.jpg"),
                      )
                    ],
                  )
              ),
            ListTile(
              leading: const Icon(Icons.home),
              trailing:const Icon(Icons.arrow_forward_ios),
              title: const Text("Home"),
              onTap: () {
                // Code à exécuter lorsque l'élément ListTile est tapé
                print("L'élément Home a été tapé !");
              },
            ),
            const Divider(height: 10,color: Colors.blue,),
            ListTile(
              leading: const Icon(Icons.contact_emergency),
              title: const Text("Nos Enseignant"),
              onTap: (){
                // fermeture du menu
                Navigator.of(context).pop();
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=> EnseignantsPage())
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_emergency),
              title: const Text("Mes Collegues"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> const EtudiantPage())
                );
              },
            )
          ],
        ),
      ),
      body: const Center(
        child: ElevatedButton(onPressed: _launchUrl  , child: Text("Test Url")),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}