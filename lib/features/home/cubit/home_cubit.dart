import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/features/home/notes_repository.dart';
import 'package:notes_app/models/notes_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final NotesRepository _notesRepository;
  HomeCubit(this._notesRepository) : super(const HomeInitial());
  Future<void> getNotes() async {
    emit(const HomeLoading());
    try {
      final noteSnapshot = await _notesRepository.notesCollection.get();
      final notes = noteSnapshot.docs
          .map(
            (doc) => NotesModel(
              id: doc.id,
              colorId: doc['color_id'],
              date: doc['date'],
              description: doc['content'],
              title: doc['notes_title'],
            ),
          )
          .toList();
      emit(HomeLoaded(notes: notes));
    } catch (e) {
      emit(HomeErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> navigateToAddNotes() async {
    emit(const HomeNavigateToAddNotesActionState());
  }
}
