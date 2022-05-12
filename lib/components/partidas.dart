import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pontinhos/data/data.dart' as globals;
import 'package:pontinhos/models/partida.dart';

class Partidas extends StatelessWidget {
  const Partidas({Key? key}) : super(key: key);

  List<Row> retornarPartidas(context) {
    List<Row> partidas = [];

    for (Partida element in globals.partidas) {
      String formattedDate =
          DateFormat('dd/MM/yyyy - HH:mm:ss').format(element.dataHora);

      Row partida = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(formattedDate)],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text(
                        'Você',
                      ),
                      Text(element.pontosUsuario.toString(),
                          style: const TextStyle(fontSize: 30))
                    ])),
                width: 90,
                height: 70,
                color: ((element.pontosUsuario > element.pontosRobot)
                    ? Colors.lightGreen.shade300
                    : Colors.grey.shade300)),
            const SizedBox(width: 10),
            Container(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text(
                        'Robot',
                      ),
                      Text(element.pontosRobot.toString(),
                          style: const TextStyle(fontSize: 30))
                    ])),
                width: 90,
                height: 70,
                color: ((element.pontosUsuario < element.pontosRobot)
                    ? Colors.lightGreen.shade300
                    : Colors.grey.shade300)),
          ]),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 1,
                child: Container(
                    height: 1, width: 250, color: Colors.grey.shade300),
              )),
        ])
      ]);

      partidas.add(partida);
    }

    if (globals.partidas.isEmpty) {
      partidas.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Nada a exibir',
              style: TextStyle(color: Colors.grey, fontSize: 25),
            )
          ]));
    }

    return partidas;
  }

  @override
  Widget build(BuildContext context) {
    List<Row> partidas = retornarPartidas(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center, children: partidas);
  }
}
