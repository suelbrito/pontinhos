import 'package:flutter/material.dart';
import 'package:pontinhos/components/pontuacao.dart';
import 'package:pontinhos/components/quadro.dart';
import 'package:pontinhos/utils/functions.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  _jogar(id) {
    setState(() {
      jogar(id, context);
    });
  }

  _reiniciar() {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Confirmação'),
            content: const Text('Tem certeza que quer reiniciar o jogo?'),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      reiniciar();
                    });

                    Navigator.of(context).pop();
                  },
                  child: const Text('Sim')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Não'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(height: 30),
          Quadro(jogar: _jogar),
          const SizedBox(height: 30),
          // ignore: prefer_const_constructors
          Pontuacao(),
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(30, 30)),
                      onPressed: _reiniciar,
                      child: const Icon(
                        Icons.settings_backup_restore,
                        size: 20,
                      ))))
        ]),
      ),
    );
  }
}
