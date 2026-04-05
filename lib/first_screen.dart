import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp2/second_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:html' as html;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();

  @override
  void dispose() {
    nomController.dispose();
    prenomController.dispose();
    super.dispose();
  }

  void envoyer() {
    String nom = nomController.text;
    String prenom = prenomController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(nom: nom, prenom: prenom),
      ),
    );
  }

  void afficherSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Bonjour ${nomController.text} ${prenomController.text}"),
      ),
    );
    Fluttertoast.showToast(
      msg: "Snackbar affiché",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }

  void afficherDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Attention"),
        content: Text("Etes vous sure de vouloir quitter?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Non"),
          ),
          FilledButton(
            onPressed: () => {SystemNavigator.pop()},
            child: const Text("Oui"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("First Screen")),
      body: Column(
        children: [
          TextField(
            controller: nomController,
            decoration: const InputDecoration(labelText: "Nom"),
          ),
          TextField(
            controller: prenomController,
            decoration: const InputDecoration(labelText: "Prénom"),
          ),
          FilledButton(onPressed: envoyer, child: const Text("Envoyer")),
          FilledButton(
            onPressed: afficherSnackbar,
            child: const Text("Afficher Snackbar"),
          ),
          FilledButton(
            onPressed: afficherDialog,
            child: const Text("Afficher Dialog"),
          ),
        ],
      ),
    );
  }
}
