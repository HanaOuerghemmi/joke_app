 import 'package:text_to_speech/text_to_speech.dart';

  TextToSpeech tts = TextToSpeech();

  void speak({required String message}) {
    tts.setVolume(1.0);
    tts.setRate(1.0);
    tts.setLanguage('en-US');
    tts.setPitch(1.0);
    tts.speak(message + 'hahhhhahahah');
  }
  void pause(){
tts.pause();
  }