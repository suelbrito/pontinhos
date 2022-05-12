import 'package:flutter/material.dart';
import 'package:pontinhos/utils/functions.dart';

class RiscoHorizontal extends StatefulWidget {
  final int linha, coluna;
  final void Function(String) jogar;

  const RiscoHorizontal(
      {Key? key,
      required this.linha,
      required this.coluna,
      required this.jogar})
      : super(key: key);

  @override
  State<RiscoHorizontal> createState() => _RiscoHorizontalState();
}

class _RiscoHorizontalState extends State<RiscoHorizontal> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: SizedBox(
          height: 5,
          width: 30,
          child: Container(
            color: getColor("h${widget.linha}${widget.coluna}"),
          ),
        ),
        onTap: () {
          widget.jogar("h${widget.linha}${widget.coluna}");
        });
  }
}
