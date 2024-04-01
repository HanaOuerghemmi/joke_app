
import 'package:bloc/bloc.dart';
import 'package:joke_app/blocs/joke_pun_cubit%20copy/joke_pun_state.dart';

import 'package:joke_app/models/jokes_models.dart';
import 'package:joke_app/services/joke_pun_service.dart';

class JokePunCubit extends Cubit<JokePunState> {
  JokePunCubit() : super(JokePunState(jokeModel: JokeModel(), showAnswer: false));

  JokePunService jokeService = JokePunService();

  Future<void> jokePunData() async {
    var jokeModel = await jokeService.getJokePunData();
    emit(state.copyWith(jokeModel: jokeModel, showAnswer: false));
  }

  showAnswer() {
    emit(state.copyWith(showAnswer: true));
  }
}