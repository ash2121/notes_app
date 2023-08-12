import 'package:cloud_firestore/cloud_firestore.dart';

class NotesRepository {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
}
