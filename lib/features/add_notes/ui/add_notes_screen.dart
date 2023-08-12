import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants/global_variables.dart';
import 'package:notes_app/features/add_notes/cubit/add_note_cubit.dart';
import 'package:notes_app/features/home/notes_repository.dart';
import 'package:notes_app/models/notes_model.dart';

import '../../home/ui/home.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final AddNoteCubit addNoteCubit = AddNoteCubit(NotesRepository());
  int color_id = Random().nextInt(GlobalVariables.notesColor.length);
  var newFormat = DateFormat("yy-MM-dd");
  String date = DateFormat.yMEd().format(DateTime.now());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> notesFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.notesColor[color_id],
      appBar: AppBar(
        title: const Text("Add new note"),
        backgroundColor: GlobalVariables.notesColor[color_id],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Form(
          key: notesFormKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  validator: (value) {
                    if (_titleController.text.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                TextFormField(
                  controller: _contentController,
                  maxLines: 2,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (_contentController.text.trim().isEmpty) {
                      return "Please add description";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(34.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  date,
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(height: 20.h),
                BlocListener<AddNoteCubit, AddNoteState>(
                  bloc: addNoteCubit,
                  listener: (context, state) {
                    if (state is AddNoteAndNavigateToHome) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Note added successfully")));
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const Home();
                      }), (route) => false);
                    }
                    if (state is AddNoteErrorState) {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      var snackBar = SnackBar(
                        content: Text(state.errorMessage),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: ElevatedButton(
                    onPressed: () async {
                      if (notesFormKey.currentState!.validate()) {
                        addNoteCubit.addNote(NotesModel(
                          id: DateTime.now().toString(),
                          title: _titleController.text,
                          description: _contentController.text,
                          date: date,
                          colorId: color_id,
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 1,
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

// FirebaseFirestore.instance
//                         .collection("notes")
//                         .add({
//                           "color_id": color_id,
//                           "content": _contentController.text,
//                           "date": date,
//                           "notes_title": _titleController.text,
//                         })
//                         .then((value) => Navigator.pop(context))
//                         .catchError((err) {
//                           ScaffoldMessenger.of(context).clearSnackBars();
//                           var snackBar = SnackBar(
//                             content: Text(err.toString()),
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                         });
