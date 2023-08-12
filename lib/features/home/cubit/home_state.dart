part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final List<NotesModel> notes;
  const HomeLoaded({required this.notes});
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  const HomeErrorState({required this.errorMessage});
}

class HomeNavigateToAddNotesActionState extends HomeState {
  const HomeNavigateToAddNotesActionState();
}
