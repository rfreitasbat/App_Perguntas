import 'package:flutter/material.dart';

import './resposta.dart';
import './questao.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.perguntaSelecionada,
    @required this.perguntas,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //for (String textResp in _perguntas[_perguntaSelecionada]['respostas']) {
    //  opcioesRespostas.add(Resposta(textResp, _responder));
    //}

    //tranformação de um tipo de codigo imperativo para uma declarativa.

    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : null;
    //List<Widget> opcioesRespostas = respostas
    //  .map((t) => Resposta(t, _responder))
    //  .toList();

    //O codigo foi colocado dentro do children que traz as respostas.
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto']),
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => quandoResponder(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
