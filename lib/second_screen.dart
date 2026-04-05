import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondScreen extends StatelessWidget {
  final String nom;
  final String prenom;

  const SecondScreen({super.key, required this.nom, required this.prenom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Column(
        children: [
          Text("Nom: $nom"),
          Text("Prénom: $prenom"),
          FilledButton(
            onPressed: () async {
              Uri url = Uri.parse("https://www.google.com");
              await launchUrl(url);
            },
            child: const Text("Visiter Google"),
          ),
        ],
      ),
    );
  }
}
