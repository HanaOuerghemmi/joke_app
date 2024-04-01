
import 'package:joke_app/models/jokes_models.dart';

class JokeRandomState {
  JokeModel jokeModel;
  bool showAnswer;

  JokeRandomState({required this.jokeModel, required this.showAnswer});

  JokeRandomState copyWith({
    JokeModel? jokeModel,
    bool? showAnswer,
  }) {
    return JokeRandomState(
        jokeModel: jokeModel ?? this.jokeModel,
        showAnswer: showAnswer ?? this.showAnswer);
  }
}