import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/blocs/joke_random_cubit/joke_random_cubit.dart';
import 'package:joke_app/blocs/joke_random_cubit/joke_random_state.dart';
import 'package:joke_app/pages/widgets/custom_folatingbutton.dart';
import 'package:joke_app/pages/widgets/joke_item_card.dart';


class RandomJoke extends StatefulWidget {
   RandomJoke({Key? key,
  this.color
  }) : super(key: key);
 Color? color; 
  @override
  RandomJokeState createState() => RandomJokeState();
}

class RandomJokeState extends State<RandomJoke> {
  @override
  void initState() {
    var provider = BlocProvider.of<JokeRandomCubit>(context);

    provider.jokeRandomData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<JokeRandomCubit>(context);

    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(

        title: Text('🤣 Random Joke 🤣'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<JokeRandomCubit, JokeRandomState>(
          builder: (context, state) {
            var data = state.jokeModel;
            var showAnswer = state.showAnswer;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: JokeItemCard(
                provider: provider, 
                data: data, 
                showAnswer: showAnswer, 
                color: widget.color,
                ),
            );
          },
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        color: widget.color,
        provider: provider,
        onpressed:  () {
        provider.jokeRandomData();
      },
        
        ),
    );
  }
}