
import 'package:bloc/bloc.dart';
import 'package:joke_app/blocs/joke_random_cubit/joke_random_state.dart';
import 'package:joke_app/models/jokes_models.dart';
import 'package:joke_app/services/joke_program_service.dart';
import 'package:joke_app/services/joke_random_service.dart';

class JokeRandomCubit extends Cubit<JokeRandomState> {
  JokeRandomCubit() : super(JokeRandomState(jokeModel: JokeModel(), showAnswer: false));

  JokeRandomService jokeService = JokeRandomService();

  Future<void> jokeRandomData() async {
    var jokeModel = await jokeService.getJokeRandomData();
    emit(state.copyWith(jokeModel: jokeModel, showAnswer: false));
  }

  showAnswer() {
    emit(state.copyWith(showAnswer: true));
  }
}