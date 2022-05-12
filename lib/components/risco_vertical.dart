import 'package:flutter/material.dart';
import 'package:pontinhos/utils/functions.dart';

class RiscoVertical extends StatefulWidget {
  final int linha, coluna;
  final void Function(String) jogar;
  const RiscoVertical(
      {Key? key,
      required this.linha,
      required this.coluna,
      required this.jogar})
      : super(key: key);

  @override
  State<RiscoVertical> createState() => _RiscoVerticalState();
}

class _RiscoVerticalState extends State<RiscoVertical> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: SizedBox(
          height: 30,
          width: 5,
          child: Container(
            color: getColor("v${widget.linha}${widget.coluna}"),
          ),
        ),
        onTap: () {
          widget.jogar("v${widget.linha}${widget.coluna}");
        });
  }
}
