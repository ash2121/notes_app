import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/features/add_notes/ui/add_notes_screen.dart';
import 'package:notes_app/features/home/cubit/home_cubit.dart';
import 'package:notes_app/features/home/notes_repository.dart';
import 'package:notes_app/features/view_note/ui/view_note_screen.dart';
import 'package:notes_app/widgets/note_card.dart';

import '../../../constants/global_variables.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeCubit homeCubit = HomeCubit(NotesRepository());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homeCubit = context.read<HomeCubit>();
      homeCubit.getNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.bgColor,
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remind me by Aditi',
                    style: TextStyle(
                      color: GlobalVariables.titleColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search_outlined,
                        size: 30.w,
                        color: GlobalVariables.titleColor,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Your notes',
              style:
                  TextStyle(fontSize: 20.sp, color: GlobalVariables.titleColor),
            ),
            Expanded(child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial || state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is HomeLoaded) {
                  final notes = state.notes;
                  return notes.isEmpty
                      ? Center(
                          child: Text(
                          "No notes created",
                          style: TextStyle(
                            fontSize: 26.sp,
                            color: Colors.white,
                          ),
                        ))
                      : GridView.builder(
                          itemCount: notes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ViewNoteScreen(note: notes[index]),
                                  ));
                                },
                                child: NoteCard(doc: notes[index]));
                          },
                        );
                }
                if (state is HomeErrorState) {
                  return Center(
                    child: Text(
                      state.errorMessage.toString(),
                      style: TextStyle(
                        fontSize: 24.sp,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                return Container();
              },
            ))
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddNotesScreen(),
            ));
          },
          elevation: 0,
          backgroundColor: GlobalVariables.titleColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
// StreamBuilder<QuerySnapshot>(
//                 stream:
//                     FirebaseFirestore.instance.collection("notes").snapshots(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }
//                   if (snapshot.hasData) {
//                     return GridView(
//                         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                         ),
//                         children: snapshot.data!.docs
//                             .map((note) => NoteCard(doc: note))
//                             .toList());
//                   }
//                   return const Text("No Notes Found!");
//                 },
//               ),
