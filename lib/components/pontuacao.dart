import 'package:flutter/material.dart';
import 'package:pontinhos/data/data.dart' as globals;

class Pontuacao extends StatelessWidget {
  const Pontuacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        'Pontuação',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const Text(
                    'Você',
                  ),
                  Text(globals.pontosUsuario.toString(),
                      style: const TextStyle(fontSize: 30))
                ])),
            width: 90,
            height: 70,
            color: Colors.blue.shade300),
        const SizedBox(width: 10),
        Container(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const Text(
                    'Robot',
                  ),
                  Text(globals.pontosRobot.toString(),
                      style: const TextStyle(fontSize: 30))
                ])),
            width: 90,
            height: 70,
            color: Colors.red.shade300)
      ])
    ]);
  }
}
