import 'package:flutter/material.dart';

class BotaoB extends StatelessWidget {
  final String texto;
  final double tamanho;
  final Color corDeFundo;
  final Color corDoTexto;
  final VoidCallback onPressed;

  const BotaoB(
      {super.key,
      required this.texto,
      required this.tamanho,
      required this.corDeFundo,
      required this.corDoTexto,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          texto,
          style: TextStyle(fontSize: tamanho),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: corDeFundo,
          foregroundColor: corDoTexto,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }
}
