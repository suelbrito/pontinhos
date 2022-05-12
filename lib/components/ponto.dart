import 'package:flutter/material.dart';

class Ponto extends StatefulWidget {
  const Ponto({Key? key}) : super(key: key);

  @override
  State<Ponto> createState() => _PontoState();
}

class _PontoState extends State<Ponto> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5,
      width: 5,
      child: Container(color: Colors.black),
    );
  }
}
