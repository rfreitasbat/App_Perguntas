import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int resultadoTeste;
  final void Function() reiniciarQuestionario;

  Resultado(this.resultadoTeste, this.reiniciarQuestionario);

  String get fraseResultado {
    if (resultadoTeste < 10) {
      return 'Parabéns!';
    } else if (resultadoTeste < 17) {
      return 'Você é uma pessoa daora!!';
    } else if (resultadoTeste < 23) {
      return 'Você é foda!!!';
    } else {
      return 'Nível lado negro da força';
    }
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar??',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: reiniciarQuestionario,
        )
      ],
    );
  }
}
