import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/blocs/joke_programing_cubit/joke_programing_cubit.dart';
import 'package:joke_app/blocs/joke_pun_cubit%20copy/joke_pun_cubit.dart';
import 'package:joke_app/blocs/joke_random_cubit/joke_random_cubit.dart';
import 'package:joke_app/pages/home_page.dart';
import 'package:joke_app/pages/programing_joke.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //cubit for programing joke
        BlocProvider<JokeProgramingCubit>(create: (_) => JokeProgramingCubit()),
        //cubit for random joke    
        BlocProvider<JokeRandomCubit>(create: (_) => JokeRandomCubit()),
           //cubit for pun joke   
         BlocProvider<JokePunCubit>(create: (_) => JokePunCubit())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
        //ProgramingJoke(),
         HomePage(),
      ),
    );
  }
}
