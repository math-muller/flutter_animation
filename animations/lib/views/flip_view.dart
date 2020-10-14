import 'dart:math';

import 'package:flutter/material.dart';

class FlipView extends StatefulWidget {
  @override
  _FlipViewState createState() => _FlipViewState();
}

class _FlipViewState extends State<FlipView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  AnimationStatus animationStatus = AnimationStatus.dismissed;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);

    animationController.addListener(() {
      setState(() {});
    });

    animationController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..rotateX(pi * (animation.value)),
              child: Container(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/fantasma.jpg'),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: RaisedButton(
              color: Colors.black,
              child: Text(
                'VOLTAR',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 140, top: 60),
            alignment: Alignment.topLeft,
            child: RaisedButton(
              color: Colors.black,
              child: Text(
                'AVANÇAR',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/pulse_view');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.play_arrow),
        onPressed: () {
          animationController.forward();
        },
      ),
    );
  }
}
