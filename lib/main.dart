import 'package:calculadora/calculadora.dart';
//import 'package:calculadora/calculadoraTeste.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      title: 'Calculadora',
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('')),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: CalculadoraP()
          ),
    );
  }
}
