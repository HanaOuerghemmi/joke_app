
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/models/jokes_models.dart';
import 'package:joke_app/services/functions/voice_function.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_switch/flutter_switch.dart';

class JokeItemCard extends StatefulWidget {
   JokeItemCard({
    super.key,
    this.color,
    required this.provider, 
    required this.data, 
    required this.showAnswer,
  });
  Color? color;
  final  provider;
  final JokeModel data;
  final bool showAnswer;

  @override
  State<JokeItemCard> createState() => _JokeItemCardState();
}

class _JokeItemCardState extends State<JokeItemCard> {
      bool get supportPause => defaultTargetPlatform != TargetPlatform.android;

      bool status = false;

  @override
  Widget build(BuildContext context) {

    return  Container(
            decoration: BoxDecoration(
              color: widget.color ??  Colors.amber[100] ,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.black26,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    Text(
                      widget.data.setup ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    !widget.showAnswer
                        ? TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.6),
                                elevation: 2,
                                padding: const EdgeInsets.all(20)),
                            onPressed: () {
                              widget.provider.showAnswer();
                            },
                            child: const Text(
                              "Answer",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ))
                        : Column(
                          children: [
                            Text(
                                widget.data.delivery ?? '',
                                textAlign: TextAlign.center,
                                style:  TextStyle(
                                  
                                    fontSize: 22,
                                    color:  Colors.amber,
                                    fontWeight: FontWeight.w600),
                              ),
                              
                           
          FlutterSwitch(
          activeColor: Colors.black12,
          activeIcon: Icon(Icons.record_voice_over_rounded),
          inactiveIcon: Icon(Icons.voice_over_off_rounded),
          value: status,
          onToggle: (value) {
            setState(() {
              status = value;
              if (status) { 
                // If switch is on, speak
                speak(message: widget.data.delivery!);
              } else {
                // If switch is off, pause
                pause();
              }
            });
          },
                  ),
                    Lottie.network('https://lottie.host/53a99cad-0c6c-4696-89b1-1e1ef5bddafe/Bi9VxvPP7X.json'),
                         
                  ],
                ),
                  ]
              ),
            ),
            )
          );
        
   
  }
}