import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants/global_variables.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  int color_id = Random().nextInt(GlobalVariables.notesColor.length);
  var newFormat = DateFormat("yy-MM-dd");
  String date = DateFormat.yMEd().format(DateTime.now());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.notesColor[color_id],
      appBar: AppBar(
        title: const Text("Add new note"),
        backgroundColor: GlobalVariables.notesColor[color_id],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Note title"),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(date),
              TextFormField(
                controller: _contentController,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Note content"),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () async {
                    FirebaseFirestore.instance
                        .collection("notes")
                        .add({
                          "color_id": color_id,
                          "content": _contentController.text,
                          "date": date,
                          "notes_title": _titleController.text,
                        })
                        .then((value) => Navigator.pop(context))
                        .catchError((err) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          var snackBar = SnackBar(
                            content: Text(err.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("save"))
            ]),
      ),
    );
  }
}
