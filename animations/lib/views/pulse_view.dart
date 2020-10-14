import 'package:flutter/material.dart';

class PulseView extends StatefulWidget {
  @override
  _PulseViewState createState() => _PulseViewState();
}

class _PulseViewState extends State<PulseView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Size> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    animation = Tween<Size>(
      begin: Size(200, 200),
      end: Size(250, 250),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
      ),
    );

    animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  width: animation.value.width,
                  height: animation.value.height,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/fantasma.jpg'),
                  ),
                );
              },
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
                Navigator.pushNamed(context, '/slide_view');
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
