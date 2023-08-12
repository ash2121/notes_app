import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants/global_variables.dart';
import 'package:notes_app/features/add_notes/cubit/add_note_cubit.dart';
import 'package:notes_app/features/home/notes_repository.dart';
import 'package:notes_app/models/notes_model.dart';

import '../../home/ui/home.dart';

class ViewNoteScreen extends StatelessWidget {
  ViewNoteScreen({super.key, required this.note});
  final NotesModel note;
  final AddNoteCubit cubit = AddNoteCubit(NotesRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: GlobalVariables.contentColor,
                      )),
                  Text(
                    note.title,
                    style: TextStyle(
                        color: GlobalVariables.contentColor, fontSize: 24),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        size: 32,
                        color: GlobalVariables.contentColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                        size: 32,
                        color: GlobalVariables.contentColor,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                note.date,
                style: TextStyle(
                    fontSize: 20,
                    color: GlobalVariables.contentColor.withOpacity(0.7)),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                  child: Text(note.description,
                      style: TextStyle(
                          fontSize: 20, color: GlobalVariables.contentColor))),
            ]),
      ),
    );
  }
}
