import 'package:flutter/material.dart';
import 'package:pontinhos/components/linha_impar.dart';
import 'package:pontinhos/components/linha_par.dart';

class Quadro extends StatefulWidget {
  final void Function(String) jogar;

  const Quadro({Key? key, required this.jogar}) : super(key: key);

  @override
  State<Quadro> createState() => _QuadroState();
}

class _QuadroState extends State<Quadro> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LinhaImpar(id: 1, jogar: widget.jogar),
          LinhaPar(id: 1, jogar: widget.jogar),
          LinhaImpar(id: 2, jogar: widget.jogar),
          LinhaPar(id: 2, jogar: widget.jogar),
          LinhaImpar(id: 3, jogar: widget.jogar),
          LinhaPar(id: 3, jogar: widget.jogar),
          LinhaImpar(id: 4, jogar: widget.jogar),
          LinhaPar(id: 4, jogar: widget.jogar),
          LinhaImpar(id: 5, jogar: widget.jogar),
          LinhaPar(id: 5, jogar: widget.jogar),
          LinhaImpar(id: 6, jogar: widget.jogar),
          LinhaPar(id: 6, jogar: widget.jogar),
          LinhaImpar(id: 7, jogar: widget.jogar),
          LinhaPar(id: 7, jogar: widget.jogar),
          LinhaImpar(id: 8, jogar: widget.jogar)
        ]);
  }
}
