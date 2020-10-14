import 'package:animacoes/views/fade_view.dart';
import 'package:animacoes/views/flip_view.dart';
import 'package:animacoes/views/pulse_view.dart';
import 'package:animacoes/views/slide_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FadeView(),
        '/flip_view': (context) => FlipView(),
        '/pulse_view': (context) => PulseView(),
        '/slide_view': (context) => SlideView(),
      },
      title: 'ANIMAÇÕES',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

/*
theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
*/
