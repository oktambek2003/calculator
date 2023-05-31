import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica/home.dart';

void main(List<String> args) {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(),);
  }
}
