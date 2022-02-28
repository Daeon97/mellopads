part of 'mellopad_bloc.dart';

abstract class MellopadEvent extends Equatable {
  const MellopadEvent();

  @override
  List<Object> get props => [];
}

class GetMellopadDataEvent extends MellopadEvent {
  const GetMellopadDataEvent();

  @override
  List<Object> get props => [];
}
