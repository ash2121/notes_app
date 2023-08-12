import 'package:flutter/material.dart';
import 'package:notes_app/constants/global_variables.dart';
import 'package:notes_app/models/notes_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.doc});
  final NotesModel doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: GlobalVariables.notesColor[doc.colorId]),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doc.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: GlobalVariables.bgColor,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              doc.date,
              style: TextStyle(
                fontSize: 14,
                color: GlobalVariables.bgColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              doc.description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                overflow: TextOverflow.clip,
                fontWeight: FontWeight.w400,
                color: GlobalVariables.bgColor,
              ),
            ),
          ]),
    );
  }
}
