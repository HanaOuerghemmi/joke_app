
import 'package:bloc/bloc.dart';
import 'package:joke_app/blocs/joke_programing_cubit/joke_programing_state.dart';
import 'package:joke_app/models/jokes_models.dart';
import 'package:joke_app/services/joke_program_service.dart';

class JokeProgramingCubit extends Cubit<JokeProgramingState> {
  JokeProgramingCubit() : super(JokeProgramingState(jokeModel: JokeModel(), showAnswer: false));

  JokeProgrammingService jokeService = JokeProgrammingService();

  Future<void> jokeProgramingData() async {
    var jokeModel = await jokeService.getJokeProgrammingData();
    emit(state.copyWith(jokeModel: jokeModel, showAnswer: false));
  }

  showAnswer() {
    emit(state.copyWith(showAnswer: true));
  }
}