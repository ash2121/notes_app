import 'package:bloc/bloc.dart';
import 'package:notes_app/features/home/notes_repository.dart';
import 'package:notes_app/models/notes_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final NotesRepository _notesRepository;
  // final NotesModel newNote;
  AddNoteCubit(
    this._notesRepository,
    // this.newNote,
  ) : super(AddNoteInitial());
  Future addNote(NotesModel notesModel) async {
    try {
      await _notesRepository.notesCollection.add({
        'id': notesModel.id,
        'color_id': notesModel.colorId,
        'date': notesModel.date,
        'content': notesModel.description,
        'notes_title': notesModel.title,
      });
      emit(AddNoteAndNavigateToHome());
    } catch (e) {
      emit(AddNoteErrorState(e.toString()));
    }
  }
}
