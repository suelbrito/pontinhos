import 'package:flutter/material.dart';
import 'package:pontinhos/components/quadrado.dart';
import 'package:pontinhos/components/risco_vertical.dart';

class LinhaPar extends StatefulWidget {
  final int id;
  final void Function(String) jogar;
  const LinhaPar({Key? key, required this.id, required this.jogar})
      : super(key: key);

  @override
  State<LinhaPar> createState() => _LinhaParState();
}

class _LinhaParState extends State<LinhaPar> {
  Widget montarLinha() {
    List<Widget> linha = [];

    for (int i = 0; i < 7; i++) {
      linha.add(RiscoVertical(
          linha: widget.id, coluna: (i + 1), jogar: widget.jogar));
      linha.add(Quadrado(linha: widget.id, coluna: (i + 1)));
      if (i == 6) {
        linha.add(RiscoVertical(
            linha: widget.id, coluna: (i + 2), jogar: widget.jogar));
      }
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: linha);
  }

  @override
  Widget build(BuildContext context) {
    return montarLinha();
  }
}
