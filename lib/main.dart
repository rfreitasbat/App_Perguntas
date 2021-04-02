import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  /* Lista <String> para _perguntas, está sendo inferida por isso não é necessario escrever todo o c código
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito',
    ];
    Mudança pra Lista de Map, uma chave e um conteudo*/
  final List<Map<String, Object>> _perguntas = [
    {
      /*Chave e String*/ 'texto': 'Qual é sua cor favorito?',
      /*Chave e Objeto*/ 'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 7},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 5},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 7},
        {'texto': 'Girafa', 'pontuacao': 5},
        {'texto': 'Smaug', 'pontuacao': 9},
        {'texto': 'mooncake', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual o melhor professor',
      'respostas': [
        {'texto': 'Yoda', 'pontuacao': 10},
        {'texto': 'Mestre Kami', 'pontuacao': 7},
        {'texto': 'Jiraya', 'pontuacao': 8},
        {'texto': 'Akeme', 'pontuacao': 9},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Peguntas'),
          ),
          // fomra rapida, atalho Ctrl + . pra envolver o texte em algo (no caso na coluna)
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntaSelecionada: _perguntaSelecionada,
                  perguntas: _perguntas,
                  quandoResponder: _responder,
                )
              : Resultado(
                  _pontuacaoTotal,
                  _reiniciarQuestionario,
                )),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
/*
Uma forma de fazer (geito comprido), agrupar varios widgets para organização
 body: Column(
  children: [
    Text('Linha 1'),
    Text('Linha 2'),
    Text('Linha 3'),
  ],
)
  Questao(_perguntas[_perguntaSelecionada]),
    uma fomra de utilizar a Lista Perguntas pegando o elemtno
    ext(_perguntas.elementAt(1)),
    Outra forma de utilizar a Lista Perguntas Ambas as fomras de se utilizar a lista estão corretas


 RaisedButton(
    child: Text('Resposta 1'),
    onPressed: _responder,
    utilizando o botao com uma função pré estabelecida PASSANDO a função
  ),


  RaisedButton(
    child: Text('Resposta 2'),
    onPressed: () { print('Resposta 2 foi selecionada!!!');},S
    usnado o botão criando uma função dentro dele
  ),

  RaisedButton(
    child: Text('Resposta 3'),
    onPressed: () => print('Resposta 3 uhull!!!'),
    outra forma de usar o botão utilizando função arrow
  ),


*/
