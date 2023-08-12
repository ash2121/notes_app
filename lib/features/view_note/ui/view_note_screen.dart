import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/constants/global_variables.dart';
import 'package:notes_app/features/add_notes/cubit/add_note_cubit.dart';
import 'package:notes_app/features/home/notes_repository.dart';
import 'package:notes_app/models/notes_model.dart';

class ViewNoteScreen extends StatelessWidget {
  ViewNoteScreen({super.key, required this.note});
  final NotesModel note;
  final AddNoteCubit cubit = AddNoteCubit(NotesRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.bgColor,
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
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
                        size: 18.w,
                        color: GlobalVariables.contentColor,
                      )),
                  Text(
                    note.title,
                    style: TextStyle(
                      color: GlobalVariables.contentColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        size: 20.w,
                        color: GlobalVariables.contentColor,
                      )),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                note.date,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: GlobalVariables.contentColor.withOpacity(0.7)),
              ),
              SizedBox(
                height: 12.h,
              ),
              Expanded(
                  child: Text(note.description,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: GlobalVariables.contentColor,
                      ))),
            ]),
      ),
    );
  }
}
