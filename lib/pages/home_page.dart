// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:joke_app/pages/loading_page.dart';

import 'package:joke_app/pages/programing_joke.dart';
import 'package:joke_app/pages/pun_joke_page.dart';
import 'package:joke_app/pages/random_joke.dart';
import 'package:joke_app/pages/widgets/joke_cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  final bool isLoading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tell Me a Joke 😁',
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2, // You can adjust the number of columns here
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.all(10),
        children: [
          JokeCart(
            root: ProgramingJoke(color: Colors.pinkAccent),
             color: Colors.amber, text: 'programing joke ',),
         JokeCart(
            isLoading: isLoading,
            root:RandomJoke(color:Colors.deepPurple ), 
            color: Colors.green,text: 'random joke '),


          JokeCart(root: PunJoke(color: Colors.blue[900],), color: const Color.fromRGBO(64, 196, 255, 1), text: 'Pun'),
          // JokeCart(root:   ProgramingJoke(), color: Colors.deepPurple, text: 'terxt voice '),
          // JokeCart(root: ProgramingJoke(), color: Colors.purple,text: 'programing joke '),
          // JokeCart(root: ProgramingJoke(), color: Colors.pinkAccent, text: 'programing joke '),
        ],
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [

      //     JokeCart(root: ProgramingJoke(),color: Colors.amber,),
      //     JokeCart(root: RandomJoke(), color: Colors.green,)
      //   ],
      // ),
    );
  }
}
