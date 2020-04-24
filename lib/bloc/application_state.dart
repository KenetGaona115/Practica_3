part of 'application_bloc.dart';

abstract class ApplicationState extends Equatable {
  const ApplicationState();
}

class ApplicationInitial extends ApplicationState {
  @override
  List<Object> get props => [];
}

class FakeDataFetchedState extends ApplicationState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ApplicationState {
  @override
  List<Object> get props => [];
}

class ErrorState extends ApplicationState {
  final String message;

  ErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}

class PictureChosenState extends ApplicationState {
  final File image;

  PictureChosenState({@required this.image});
  @override
  List<Object> get props => [image];
}
