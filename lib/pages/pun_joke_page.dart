import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/blocs/joke_pun_cubit%20copy/joke_pun_cubit.dart';
import 'package:joke_app/blocs/joke_pun_cubit%20copy/joke_pun_state.dart';
import 'package:joke_app/blocs/joke_random_cubit/joke_random_cubit.dart';
import 'package:joke_app/blocs/joke_random_cubit/joke_random_state.dart';
import 'package:joke_app/pages/widgets/custom_folatingbutton.dart';
import 'package:joke_app/pages/widgets/joke_item_card.dart';


class PunJoke extends StatefulWidget {
   PunJoke({Key? key,
  this.color
  }) : super(key: key);
 Color? color; 
  @override
  PunJokeState createState() => PunJokeState();
}

class PunJokeState extends State<PunJoke> {
  @override
  void initState() {
    var provider = BlocProvider.of<JokePunCubit>(context);

    provider.jokePunData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<JokePunCubit>(context);

    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(

        title: Text('🤣 Pun Joke 🤣'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<JokePunCubit, JokePunState>(
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
        provider.jokePunData();
      },
        
        ),
    );
  }
}