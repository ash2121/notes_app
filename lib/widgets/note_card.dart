import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/constants/global_variables.dart';
import 'package:notes_app/models/notes_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.doc});
  final NotesModel doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.all(8.w),
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
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: GlobalVariables.bgColor,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              doc.date,
              style: TextStyle(
                fontSize: 14.sp,
                color: GlobalVariables.bgColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              doc.description,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.sp,
                overflow: TextOverflow.clip,
                fontWeight: FontWeight.w400,
                color: GlobalVariables.bgColor,
              ),
            ),
          ]),
    );
  }
}
