import 'package:flutter/material.dart';

class Mapscreen extends StatelessWidget {
  static const routeName = '/mapScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(238, 231, 238, 1).withOpacity(0.5),
                Color.fromRGBO(114, 112, 109, 1).withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 2],
            ),
          ),
        ),
        Center(
          child: Text('Map Screen',style: TextStyle(fontSize: 40),),
        )
      ],
    ));
  }
}
