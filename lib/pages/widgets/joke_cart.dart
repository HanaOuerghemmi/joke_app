import 'package:flutter/material.dart';
import 'package:joke_app/pages/loading_page.dart';

class JokeCart extends StatefulWidget {
  final Color color;
  final Widget root;
  final String text;
   bool? isLoading;
   JokeCart({
    Key? key,
    required this.root, 
    required this.color,
    required this.text,
      this.isLoading,
  }) : super(key: key);

  @override
  State<JokeCart> createState() => _JokeCartState();
}

class _JokeCartState extends State<JokeCart> {



  Future<void> _waitAndNavigate() async {
    setState(() {
      widget.isLoading = true;
    });
    // Wait for 30 seconds
    await Future.delayed(
      Duration(seconds: 5), 
      );
    setState(() {
      widget.isLoading = false;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget.root),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget.root),
    );},
      //widget.isLoading! ? null : _waitAndNavigate,
      child: Center(
        child: Container(
          height: 150,
          width: 200,
        decoration:
          BoxDecoration(
                  color: widget.color,
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
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                ),          
          child: 
          Column(
            children: [
              Text(widget.text),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/images/robot.png', width: 100, height: 100,))
            ],
          ),
        ),
      ),
    );
  }
}
