import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/repositories.dart' as repositories;
import '../../models/models.dart' as models;

part 'mellopad_event.dart';
part 'mellopad_state.dart';

class MellopadBloc extends Bloc<MellopadEvent, MellopadState> {
  MellopadBloc({
    required repositories.MellopadRepository mellopadRepository,
  }) : super(
          MellopadInitial(),
        ) {
    on<GetMellopadDataEvent>(
      (event, emit) {
        //.
      },
    );
  }
}
