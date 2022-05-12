import 'package:flutter/material.dart';
import 'package:pontinhos/components/ponto.dart';
import 'package:pontinhos/components/risco_horizontal.dart';

class LinhaImpar extends StatefulWidget {
  final int id;
  final void Function(String) jogar;
  const LinhaImpar({Key? key, required this.id, required this.jogar})
      : super(key: key);

  @override
  State<LinhaImpar> createState() => _LinhaImparState();
}

class _LinhaImparState extends State<LinhaImpar> {
  Widget montarLinha() {
    List<Widget> linha = [];

    for (int i = 0; i < 7; i++) {
      linha.add(const Ponto());
      linha.add(RiscoHorizontal(
          linha: widget.id, coluna: (i + 1), jogar: widget.jogar));
      if (i == 6) {
        linha.add(const Ponto());
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: linha,
    );
  }

  @override
  Widget build(BuildContext context) {
    return montarLinha();
  }
}
