import 'package:flutter/material.dart';

class CalculadoraT extends StatefulWidget {
  const CalculadoraT({super.key});

  @override
  State<CalculadoraT> createState() => _CalculadoraTState();
}

class _CalculadoraTState extends State<CalculadoraT> {
  String display = '';  // Exibe o valor atual e a operação
  String equation = ''; // Equação atual que o usuário está digitando
  double? num1;         // Primeiro número
  double? num2;         // Segundo número
  String operator = ''; // Operador atual

  // Função chamada quando o botão é pressionado
  void funcaoDisplay(String value) {
    setState(() {
      if (value == 'C') {
        // Limpa tudo
        display = '';
        equation = '';
        num1 = null;
        num2 = null;
        operator = '';
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        // Define o operador e o primeiro número
        if (operator.isEmpty && display.isNotEmpty) {
          operator = value;
          equation += ' $value ';  // Adiciona o operador com espaços para legibilidade
          num1 = double.tryParse(display);
        }
      } else if (value == '=') {
        // Realiza o cálculo com base no operador
        if (operator.isNotEmpty && num1 != null) {
          num2 = double.tryParse(display);
          _calculate();
        }
      } else {
        // Atualiza o display com os números digitados
        display += value;
        equation += value;
      }
    });
  }

  // Função para realizar o cálculo de acordo com o operador
  void _calculate() {
    if (num1 != null && num2 != null) {
      double result = 0;
      if (operator == '+') {
        result = num1! + num2!;
      } else if (operator == '-') {
        result = num1! - num2!;
      } else if (operator == '*') {
        result = num1! * num2!;
      } else if (operator == '/') {
        if (num2 != 0) {
          result = num1! / num2!;
        } else {
          display = 'Erro'; // Evita divisão por zero
          return;
        }
      }
      display = result.toString(); // Exibe o resultado final no display
      equation = display;  // Reseta a equação com o resultado
      operator = '';
      num1 = null;
      num2 = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Exibe a equação completa, incluindo os números e operadores
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerRight,
            child: Text(
              equation.isEmpty ? '0' : equation, // Mostra a equação ou '0' se vazia
              style: const TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        // Mostra o resultado ou o número que está sendo digitado
        // Expanded(
        //   child: Container(
        //     padding: const EdgeInsets.all(16.0),
        //     alignment: Alignment.centerRight,
        //     child: Text(
        //       display.isEmpty ? '0' : display, // Mostra o display ou '0' se vazio
        //       style: const TextStyle(
        //         fontSize: 48.0,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => funcaoDisplay('C'), child: Text('C')),
            ElevatedButton(onPressed: () => funcaoDisplay('1'), child: Text('1')),
            ElevatedButton(onPressed: () => funcaoDisplay('2'), child: Text('2')),
            ElevatedButton(onPressed: () => funcaoDisplay('3'), child: Text('3')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => funcaoDisplay('+'), child: Text('+')),
            ElevatedButton(onPressed: () => funcaoDisplay('4'), child: Text('4')),
            ElevatedButton(onPressed: () => funcaoDisplay('5'), child: Text('5')),
            ElevatedButton(onPressed: () => funcaoDisplay('6'), child: Text('6')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => funcaoDisplay('-'), child: Text('-')),
            ElevatedButton(onPressed: () => funcaoDisplay('7'), child: Text('7')),
            ElevatedButton(onPressed: () => funcaoDisplay('8'), child: Text('8')),
            ElevatedButton(onPressed: () => funcaoDisplay('9'), child: Text('9')),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () => funcaoDisplay('='), child: Text('=')),
            ElevatedButton(onPressed: () => funcaoDisplay('0'), child: Text('0')),
            ElevatedButton(onPressed: () => funcaoDisplay('*'), child: Text('*')),
            ElevatedButton(onPressed: () => funcaoDisplay('/'), child: Text('/')),
          ],
        ),
      ],
    );
  }
}
