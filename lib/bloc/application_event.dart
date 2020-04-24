part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();
}

class FakeFetchDataEvent extends ApplicationEvent {
  @override
  List<Object> get props => [];
}

class TakePictureEvent extends ApplicationEvent {
  @override
  List<Object> get props => [];
}

class BarcodeDetectorEvent extends ApplicationEvent {
  @override
  List<Object> get props => [];
}

class ImageDetectorEvent extends ApplicationEvent {
  @override
  List<Object> get props => [];
}
