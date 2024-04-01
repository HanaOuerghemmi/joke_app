import 'dart:convert';
import 'dart:developer';
import 'package:joke_app/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:joke_app/models/jokes_models.dart';

class JokePunService {
  Future<JokeModel> getJokePunData() async {
    dynamic jokePundata;

    try {
      var response = await http.Client().get(
          Uri.parse("https://jokeapi-v2.p.rapidapi.com/joke/Pun?type=twopart"),
          headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        jokePundata = JokeModel.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load ');
      }
    } catch (error) {
      log(error.toString());
    }

    return jokePundata;
  }
}
