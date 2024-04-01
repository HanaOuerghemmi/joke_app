
import 'package:joke_app/models/jokes_models.dart';

class JokeProgramingState {
  JokeModel jokeModel;
  bool showAnswer;

  JokeProgramingState({required this.jokeModel, required this.showAnswer});

  JokeProgramingState copyWith({
    JokeModel? jokeModel,
    bool? showAnswer,
  }) {
    return JokeProgramingState(
        jokeModel: jokeModel ?? this.jokeModel,
        showAnswer: showAnswer ?? this.showAnswer);
  }
}