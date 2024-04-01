
import 'package:joke_app/models/jokes_models.dart';

class JokePunState {
  JokeModel jokeModel;
  bool showAnswer;

  JokePunState({required this.jokeModel, required this.showAnswer});

  JokePunState copyWith({
    JokeModel? jokeModel,
    bool? showAnswer,
  }) {
    return JokePunState(
        jokeModel: jokeModel ?? this.jokeModel,
        showAnswer: showAnswer ?? this.showAnswer);
  }
}