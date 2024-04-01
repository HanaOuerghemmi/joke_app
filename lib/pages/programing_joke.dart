import 'package:flutter/material.dart';
import 'package:joke_app/blocs/joke_programing_cubit/joke_programing_cubit.dart';
import 'package:joke_app/blocs/joke_programing_cubit/joke_programing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:joke_app/constants/constants.dart';
import 'package:joke_app/pages/widgets/custom_folatingbutton.dart';
import 'package:joke_app/pages/widgets/joke_item_card.dart';
import 'package:lottie/lottie.dart';

class ProgramingJoke extends StatefulWidget {
   ProgramingJoke({Key? key,
   this.color
   }) : super(key: key);
Color? color;
  @override
  ProgramingJokeState createState() => ProgramingJokeState();
}

class ProgramingJokeState extends State<ProgramingJoke> {
  @override
  void initState() {
    var provider = BlocProvider.of<JokeProgramingCubit>(context);

    provider.jokeProgramingData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<JokeProgramingCubit>(context);

    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('🤣 Programming Joke 🤣'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<JokeProgramingCubit, JokeProgramingState>(
          builder: (context, state) {
            var data = state.jokeModel;
            var showAnswer = state.showAnswer;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              JokeItemCard(
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
        provider: provider, 
        color: widget.color,
        onpressed:  () {
        provider.jokeProgramingData();
      },),
    );
  }
}