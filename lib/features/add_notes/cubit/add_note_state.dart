part of 'add_note_cubit.dart';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteErrorState extends AddNoteState {
  final String errorMessage;

  AddNoteErrorState(this.errorMessage);
}

class DeleteNoteErrorState extends AddNoteState {
  final String errorMessage;

  DeleteNoteErrorState(this.errorMessage);
}

class AddNoteAndNavigateToHome extends AddNoteState {}

class DeleteNoteAndNavigateToHome extends AddNoteState {}
