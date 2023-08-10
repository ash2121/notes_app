import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants/global_variables.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.doc});
  final QueryDocumentSnapshot doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: GlobalVariables.notesColor[doc["color_id"]]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc["notes_title"],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              doc["date"],
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              doc["content"],
              style: const TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.clip,
                  fontWeight: FontWeight.w400),
            ),
          ]),
    );
  }
}
