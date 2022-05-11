import 'package:flutter/material.dart';
import 'package:pontinhos/components/pontuacao.dart';
import 'package:pontinhos/components/quadro.dart';
import 'package:pontinhos/utils/functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo dos pontinhos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pontinhos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _jogar(id) {
    setState(() {
      jogar(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(height: 30),
          Quadro(jogar: _jogar),
          const SizedBox(height: 30),
          Pontuacao()
        ]),
      ),
    );
  }
}
