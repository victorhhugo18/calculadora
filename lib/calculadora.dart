// ignore_for_file: prefer_const_constructors

import 'package:calculadora/components/botaoIndividual.dart';
import 'package:calculadora/components/espacamento_h.dart';
import 'package:flutter/material.dart';

class CalculadoraP extends StatefulWidget {
  const CalculadoraP({super.key});

  @override
  State<CalculadoraP> createState() => _CalculadoraPState();
}

class _CalculadoraPState extends State<CalculadoraP> {
  String display = '0';
  String operador = '';
  double num1 = 0;
  double num2 = 0;

  // Função para atualizar o display, escolher o operador e armazenar os números
  void funcaoDisplay(String value) {
    setState(() {
      if (value == 'C') {
        display = '0';
        operador = '';
        num1 = 0;
        num2 = 0;
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        operador = value;
        num1 = double.tryParse(display) ?? 0;
        display = '0';
      } else if (value == '=') {
        num2 = double.tryParse(display) ?? 0;
        calcular();
      } else {
        if (display == '0') {
          display = value;
        } else {
          display += value;
        }
      }
    });
  }

  // Função para realizar o calculo
  void calcular() {
    double resultado = 0;
    switch (operador) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '*':
        resultado = num1 * num2;
        break;
      case '/':
        resultado = num1 / num2;
        break;
    }
    display = resultado.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        EspacamentoH(h: 15),
        Expanded(
            child: Row(
          children: [
            // Display
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerRight,
              child: Text(
                display,
                style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ))
          ],
        )),
        Divider(
          color: Colors.grey,
          height: 1,
          thickness: 0.5,
          indent: 16,
          endIndent: 16,
        ),
        EspacamentoH(h: 20),
        // Botões numéricos
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotaoB(
                texto: 'C',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: Colors.red,
                onPressed: () => funcaoDisplay('C')), // Chama a função para atualizar o display
            BotaoB(
                texto: '()',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('()')),
            BotaoB(
                texto: '%',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('%')),
            BotaoB(
                texto: '.',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: const Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('.')),
          ],
        ),
        EspacamentoH(h: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotaoB(
                texto: '7',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('7')),
            BotaoB(
                texto: '8',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('8')),
            BotaoB(
                texto: '9',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('9')),
            BotaoB(
                texto: '+',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 30.0,
                corDoTexto: const Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('+')),
          ],
        ),
        EspacamentoH(h: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotaoB(
                texto: '4',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('4')),
            BotaoB(
                texto: '5',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('5')),
            BotaoB(
                texto: '6',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('6')),
            BotaoB(
                texto: '-',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('-')),
          ],
        ),
        EspacamentoH(h: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotaoB(
                texto: '1',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('1')),
            BotaoB(
                texto: '2',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('2')),
            BotaoB(
                texto: '3',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('3')),
            BotaoB(
                texto: '*',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('*')),
          ],
        ),
        EspacamentoH(h: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotaoB(
                texto: ',',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay(',')),
            BotaoB(
                texto: '0',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Colors.white,
                onPressed: () => funcaoDisplay('0')),
            BotaoB(
                texto: '/',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('/')),
            BotaoB(
                texto: '=',
                corDeFundo: Color.fromARGB(255, 43, 41, 41),
                tamanho: 35.0,
                corDoTexto: Color.fromARGB(255, 39, 168, 43),
                onPressed: () => funcaoDisplay('=')),
          ],
        ),
        EspacamentoH(h: 40),
      ],
    );
  }
}
