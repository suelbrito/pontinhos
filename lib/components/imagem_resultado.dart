import 'package:flutter/material.dart';
import 'package:pontinhos/components/pontuacao.dart';
import 'package:pontinhos/data/data.dart' as globals;

class ImagemResultado extends StatelessWidget {
  const ImagemResultado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        globals.pontosUsuario > globals.pontosRobot
            ? 'PARABÉNS'
            : 'NÃO FOI DESSA VEZ',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(height: 5),
      Text(
        globals.pontosUsuario > globals.pontosRobot
            ? 'Você venceu!'
            : 'O Robot venceu!',
        style: const TextStyle(fontSize: 20),
      ),
      Image.asset('assets/images/' +
          (globals.pontosUsuario > globals.pontosRobot ? 'user' : 'robot') +
          '.jpg'),
      const Pontuacao()
    ]);
  }
}
