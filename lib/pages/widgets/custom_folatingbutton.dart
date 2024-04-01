
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joke_app/blocs/joke_programing_cubit/joke_programing_cubit.dart';

class CustomFloatingButton extends StatelessWidget {
   CustomFloatingButton({
    super.key,
    required this.provider, required this.onpressed,
    this.color
  });

  final dynamic provider;
  final Function() onpressed;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white.withOpacity(0.8),
      onPressed:onpressed,
      child:  Icon(
        Icons.refresh_rounded,
        size: 30,
        color:color ?? Colors.amber,
      ),
    );
  }
}
