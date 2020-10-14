import 'package:flutter/material.dart';

class FadeView extends StatefulWidget {
  @override
  _FadeViewState createState() => _FadeViewState();
}

class _FadeViewState extends State<FadeView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Center(
            child: FadeTransition(
              opacity: animation,
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
                'AVANÇAR',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/flip_view');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.black,
        onPressed: () {
          animationController.forward();
        },
      ),
    );
  }
}
