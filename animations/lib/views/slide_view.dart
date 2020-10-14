import 'package:flutter/material.dart';

class SlideView extends StatefulWidget {
  @override
  _SlideViewState createState() => _SlideViewState();
}

class _SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Offset> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-2.5, 1.5),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: SlideTransition(
              position: animation,
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

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
