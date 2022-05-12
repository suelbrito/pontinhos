import 'package:flutter/material.dart';
import 'package:pontinhos/utils/functions.dart';

class Quadrado extends StatefulWidget {
  final int linha, coluna;
  const Quadrado({Key? key, required this.linha, required this.coluna})
      : super(key: key);

  @override
  State<Quadrado> createState() => _QuadradoState();
}

class _QuadradoState extends State<Quadrado> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Container(
          child: const Text(''),
          color: getAreaColor("${widget.linha}${widget.coluna}")),
    );
  }
}
