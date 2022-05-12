import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            Text(
              'Jogo dos pontinhos',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            const Text(
                'O jogo consiste em uma tabela com 8 pontinhos pretos na horizontal e 8 pontinhos pretos na vertical, formando 49 casas.\n\nOs jogadores vão alternando a vez ligando um ponto a outro.\n\nO jogador que conseguir ligar 4 pontos formando um quadrado, ganha uma casa e pode jogar novamente.\n\nQuem conseguir conquistar mais casas, vence.')
          ])),
    );
  }
}
