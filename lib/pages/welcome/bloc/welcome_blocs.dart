import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/pages/welcome/bloc/welcome_events.dart';
import 'package:bloc_flutter/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
